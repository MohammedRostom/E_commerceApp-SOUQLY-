part of 'Auth_cubit.dart';

@immutable
sealed class Auth_cubit_state {}

final class Auth_cubit_Initial extends Auth_cubit_state {}

final class Loadinges extends Auth_cubit_state {}

final class Loginnscses extends Auth_cubit_state {}

final class ChangeValue extends Auth_cubit_state {}
