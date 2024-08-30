part of 'app_theme_bloc.dart';

sealed class AppThemeState extends Equatable {
  const AppThemeState();
  
  @override
  List<Object> get props => [];
}

final class AppThemeInitial extends AppThemeState {
  
  
}

final class AppThemeChange extends AppThemeState {
  final ThemeData theme;

  const AppThemeChange({required this.theme});

  @override
  List<Object> get props => [theme];
}


