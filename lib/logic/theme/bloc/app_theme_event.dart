part of 'app_theme_bloc.dart';

sealed class AppThemeEvent extends Equatable {
  const AppThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeCurrentEvent extends AppThemeEvent {
  final BuildContext context;

  const ThemeCurrentEvent({required this.context});
}

class ThemeColorChangeEvent extends AppThemeEvent {
  final BuildContext context;
  const ThemeColorChangeEvent({required this.context});
}
