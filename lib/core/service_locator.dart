import 'package:get_it/get_it.dart';
import 'package:news_app/core/services/api_service.dart';
import 'package:news_app/features/show_news/data/data.sources/fetch_from_remote_ds.dart';
import 'package:news_app/features/show_news/domain/repositories/fethch_repo_contract.dart';
import 'package:news_app/features/show_news/data/reposotories/fetch_repo_impl.dart';
import 'package:news_app/features/show_news/domain/usecase/fetch_news.dart';
final GetIt sl =GetIt.instance;

void setUpServices(){
sl.registerSingleton<ApiService>(ApiServicesImpl());
sl.registerSingleton<FetchFromRemoteDS>(FetchFromRemoteDSImpl());
sl.registerSingleton<FetchRepo>(FetchRepoImpl());
sl.registerSingleton<FetchNewsUsecase>(FetchNewsUsecase());
}