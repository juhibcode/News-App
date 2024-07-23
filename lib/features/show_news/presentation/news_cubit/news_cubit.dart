import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/failure_successes/failures.dart';
import 'package:news_app/features/show_news/domain/usecase/fetch_news.dart';
import 'package:news_app/core/service_locator.dart';
import '../../domain/entities/new_info.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial(news :const []));

  final FetchNewsUsecase _fetchNewsUsecase = FetchNewsUsecase();
void fetchNews(String? searchText) async{
  emit(NewsLoading());
  final Either<Failure,List<NewsInfo>> fetchNewsResult =
  await _fetchNewsUsecase.fetchnews(searchText);
  fetchNewsResult.fold((l) {
            emit(NewsError());
          },(news){
    if (searchText != null){
      emit(NewsInitialSearch(news: news));
    }
    else{
      emit(NewsInitial(news: news));
    }
  }
  );
}
}
