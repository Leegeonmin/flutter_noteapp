import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels
];

List<SingleChildWidget> independentModels = [];

List<SingleChildWidget> dependentModels = [];

List<SingleChildWidget> viewModels = [];
