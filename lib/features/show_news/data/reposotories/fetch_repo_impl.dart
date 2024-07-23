import 'package:news_app/core/failure_successes/exceptions.dart';
import 'package:news_app/features/show_news/domain/entities/new_info.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/core/failure_successes/failures.dart';
import 'package:news_app/features/show_news/domain/repositories/fethch_repo_contract.dart';
import '../data.sources/fetch_from_remote_ds.dart';
import 'package:news_app/core/service_locator.dart';


class FetchRepoImpl implements FetchRepo {
  final FetchFromRemoteDS fetchFromRemoteDS=sl<FetchFromRemoteDS>();


 @override
  Future<Either<Failure,List<NewsInfo>>> fetchNews(String? searchText) async {
try{
 return Right(await fetchFromRemoteDS.fetchNews(searchText));
}on FetchException catch(e){
 return Left(FetchFailure(message: e.message));
}
 }}