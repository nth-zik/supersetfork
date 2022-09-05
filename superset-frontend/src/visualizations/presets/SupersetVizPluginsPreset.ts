import { Preset } from '@superset-ui/core';
import BubbleChartPlugin from '@superset-viz-plugins/plugin-chart-bubble';
import ComposedChartPlugin from '@superset-viz-plugins/plugin-chart-composed';
import PieChartPlugin from '@superset-viz-plugins/plugin-chart-pie';
import PivotTableChartPlugin from '@superset-viz-plugins/plugin-chart-pivot-table';
import Status from '@superset-viz-plugins/plugin-chart-status';
import WaterfallChartPlugin from '@superset-viz-plugins/plugin-chart-waterfall';

export default class SupersetVizPluginsPreset extends Preset {
  constructor() {
    super({
      name: 'SupersetVizPlugins charts',
      plugins: [
        new BubbleChartPlugin().configure({ key: 'BubbleChartPlugin' }),
        new ComposedChartPlugin().configure({ key: 'ComposedChartPlugin' }),
        new PieChartPlugin().configure({ key: 'PieChartPlugin' }),
        new PivotTableChartPlugin().configure({ key: 'PivotTableChartPlugin' }),
        new Status().configure({ key: 'Status' }),
        new WaterfallChartPlugin().configure({ key: 'WaterfallChartPlugin' }),
      ],
    });
  }
}
