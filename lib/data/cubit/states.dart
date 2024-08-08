abstract class  NewsStates{}
class NewsInitialState extends NewsStates{}
class ChangeBottomNavBarState extends NewsStates{}

class GetBusinessDataLoading extends NewsStates{}

class GetBusinessDataSuccessfully extends NewsStates{}

class GetBusinessDataError extends NewsStates{
  final String error;

  GetBusinessDataError(this.error);
}
