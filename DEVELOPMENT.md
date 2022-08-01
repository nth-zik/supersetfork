<!--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->

#Make it simple

Just run this script and enjoy

```
sh ./run-dev.sh
```

#Nova SSO
You need run this service to authenticate

```
cd sso
docker compose up -d
```

This folder have sample database for PostgreSQL KeyCloak and Kong. If you want to setup by yourself please read this documentation
[https://novaid.atlassian.net/wiki/spaces/NTGE/pages/44761121/SSO+Keycloak+Kong](https://novaid.atlassian.net/wiki/spaces/NTGE/pages/44761121/SSO+Keycloak+Kong)

#Superset

## Setup Local Environment for Development

First, [fork the repository on GitHub](https://help.github.com/articles/about-forks/), then clone it. You can clone the main repository directly, but you won't be able to send pull requests.

```bash
git clone git@github.com:your-username/superset.git
cd superset
```

### Documentation

The latest documentation and tutorial are available at https://superset.apache.org/.

The site is written using the Gatsby framework and docz for the
documentation subsection. Find out more about it in `docs/README.md`

#### Images

If you're adding new images to the documentation, you'll notice that the images
referenced in the rst, e.g.

    .. image:: _static/images/tutorial/tutorial_01_sources_database.png

aren't actually stored in that directory. Instead, you should add and commit
images (and any other static assets) to the `superset-frontend/src/assets/images` directory.
When the docs are deployed to https://superset.apache.org/, images
are copied from there to the `_static/images` directory, just like they're referenced
in the docs.

For example, the image referenced above actually lives in `superset-frontend/src/assets/images/tutorial`. Since the image is moved during the documentation build process, the docs reference the image in `_static/images/tutorial` instead.

### Flask server

#### OS Dependencies

Make sure your machine meets the [OS dependencies](https://superset.apache.org/docs/installation/installing-superset-from-scratch#os-dependencies) before following these steps.
You also need to install MySQL or [MariaDB](https://mariadb.com/downloads).

Ensure that you are using Python version 3.7 or 3.8, then proceed with:

```bash
# Create a virtual environment and activate it (recommended)
python3 -m venv venv # setup a python3 virtualenv
source venv/bin/activate

# Install external dependencies
pip install -r requirements/testing.txt

# Install Superset in editable (development) mode
pip install -e .

# Initialize the database
superset db upgrade

# Create an admin user in your metadata database (use `admin` as username to be able to load the examples)
superset fab create-admin

# Create default roles and permissions
superset init

# Load some data to play with.
# Note: you MUST have previously created an admin user with the username `admin` for this command to work.
superset load-examples

# Start the Flask dev web server from inside your virtualenv.
# Note that your page may not have CSS at this point.
# See instructions below how to build the front-end assets.
FLASK_ENV=development superset run -p 8088 --with-threads --reload --debugger
```

Or you can install via our Makefile

```bash
# Create a virtual environment and activate it (recommended)
$ python3 -m venv venv # setup a python3 virtualenv
$ source venv/bin/activate

# install pip packages + pre-commit
$ make install

# Install superset pip packages and setup env only
$ make superset

# Setup pre-commit only
$ make pre-commit
```

**Note: the FLASK_APP env var should not need to be set, as it's currently controlled
via `.flaskenv`, however if needed, it should be set to `superset.app:create_app()`**

If you have made changes to the FAB-managed templates, which are not built the same way as the newer, React-powered front-end assets, you need to start the app without the `--with-threads` argument like so:
`FLASK_ENV=development superset run -p 8088 --reload --debugger`

#### Dependencies

If you add a new requirement or update an existing requirement (per the `install_requires` section in `setup.py`) you must recompile (freeze) the Python dependencies to ensure that for CI, testing, etc. the build is deterministic. This can be achieved via,

```bash
$ python3 -m venv venv
$ source venv/bin/activate
$ python3 -m pip install -r requirements/integration.txt
$ pip-compile-multi --no-upgrade
```

When upgrading the version number of a single package, you should run `pip-compile-multi` with the `-P` flag:

```bash
$ pip-compile-multi -P my-package
```

To bring all dependencies up to date as per the restrictions defined in `setup.py` and `requirements/*.in`, run pip-compile-multi` without any flags:

```bash
$ pip-compile-multi
```

This should be done periodically, but it is recommended to do thorough manual testing of the application to ensure no breaking changes have been introduced that aren't caught by the unit and integration tests.

#### Logging to the browser console

This feature is only available on Python 3. When debugging your application, you can have the server logs sent directly to the browser console using the [ConsoleLog](https://github.com/betodealmeida/consolelog) package. You need to mutate the app, by adding the following to your `config.py` or `superset_config.py`:

```python
from console_log import ConsoleLog

def FLASK_APP_MUTATOR(app):
    app.wsgi_app = ConsoleLog(app.wsgi_app, app.logger)
```

Then make sure you run your WSGI server using the right worker type:

```bash
FLASK_ENV=development gunicorn "superset.app:create_app()" -k "geventwebsocket.gunicorn.workers.GeventWebSocketWorker" -b 127.0.0.1:8088 --reload
```

You can log anything to the browser console, including objects:

```python
from superset import app
app.logger.error('An exception occurred!')
app.logger.info(form_data)
```

### Frontend

Frontend assets (TypeScript, JavaScript, CSS, and images) must be compiled in order to properly display the web UI. The `superset-frontend` directory contains all NPM-managed frontend assets. Note that for some legacy pages there are additional frontend assets bundled with Flask-Appbuilder (e.g. jQuery and bootstrap). These are not managed by NPM and may be phased out in the future.

#### Prerequisite

##### nvm and node

First, be sure you are using the following versions of Node.js and npm:

- `Node.js`: Version 16
- `npm`: Version 7

We recommend using [nvm](https://github.com/nvm-sh/nvm) to manage your node environment:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash

cd superset-frontend
nvm install --lts
nvm use --lts
```

Or if you use the default macOS starting with Catalina shell `zsh`, try:

```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh)"
```

For those interested, you may also try out [avn](https://github.com/nvm-sh/nvm#deeper-shell-integration) to automatically switch to the node version that is required to run Superset frontend.

#### Install dependencies

Install third-party dependencies listed in `package.json` via:

```bash
# From the root of the repository
cd superset-frontend

# Install dependencies from `package-lock.json`
npm ci
```

#### Build assets

There are three types of assets you can build:

1. `npm run build`: the production assets, CSS/JSS minified and optimized
2. `npm run dev-server`: local development assets, with sourcemaps and hot refresh support
3. `npm run build-instrumented`: instrumented application code for collecting code coverage from Cypress tests

#### Webpack dev server

The dev server by default starts at `http://localhost:9000` and proxies the backend requests to `http://localhost:8088`.

So a typical development workflow is the following:

1. [run Superset locally](#flask-server) using Flask, on port `8088` — but don't access it directly,<br/>
   ```bash
   # Install Superset and dependencies, plus load your virtual environment first, as detailed above.
   FLASK_ENV=development superset run -p 8088 --with-threads --reload --debugger
   ```
2. in parallel, run the Webpack dev server locally on port `9000`,<br/>
   ```bash
   npm run dev-server
   ```
3. access `http://localhost:9000` (the Webpack server, _not_ Flask) in your web browser. This will use the hot-reloading front-end assets from the Webpack development server while redirecting back-end queries to Flask/Superset: your changes on Superset codebase — either front or back-end — will then be reflected live in the browser.

It's possible to change the Webpack server settings:

```bash
# Start the dev server at http://localhost:9000
npm run dev-server

# Run the dev server on a non-default port
npm run dev-server -- --port=9001

# Proxy backend requests to a Flask server running on a non-default port
npm run dev-server -- --supersetPort=8081

# Proxy to a remote backend but serve local assets
npm run dev-server -- --superset=https://superset-dev.example.com
```

The `--superset=` option is useful in case you want to debug a production issue or have to setup Superset behind a firewall. It allows you to run Flask server in another environment while keep assets building locally for the best developer experience.

#### Other npm commands

Alternatively, there are other NPM commands you may find useful:

1. `npm run build-dev`: build assets in development mode.
2. `npm run dev`: built dev assets in watch mode, will automatically rebuild when a file changes

#### Docker (docker-compose)

See docs [here](docker/README.md)

#### Updating NPM packages

Use npm in the prescribed way, making sure that
`superset-frontend/package-lock.json` is updated according to `npm`-prescribed
best practices.

#### Feature flags

Superset supports a server-wide feature flag system, which eases the incremental development of features. To add a new feature flag, simply modify `superset_config.py` with something like the following:

```python
FEATURE_FLAGS = {
    'SCOPED_FILTER': True,
}
```

If you want to use the same flag in the client code, also add it to the FeatureFlag TypeScript enum in [@superset-ui/core](https://github.com/apache-superset/superset-ui/blob/master/packages/superset-ui-core/src/utils/featureFlags.ts). For example,

```typescript
export enum FeatureFlag {
  SCOPED_FILTER = "SCOPED_FILTER",
}
```

`superset/config.py` contains `DEFAULT_FEATURE_FLAGS` which will be overwritten by
those specified under FEATURE_FLAGS in `superset_config.py`. For example, `DEFAULT_FEATURE_FLAGS = { 'FOO': True, 'BAR': False }` in `superset/config.py` and `FEATURE_FLAGS = { 'BAR': True, 'BAZ': True }` in `superset_config.py` will result
in combined feature flags of `{ 'FOO': True, 'BAR': True, 'BAZ': True }`.

The current status of the usability of each flag (stable vs testing, etc) can be found in `RESOURCES/FEATURE_FLAGS.md`.
