import 'package:dartz/dartz.dart';
import 'package:news_app/core/failure_successes/failures.dart';
import 'package:news_app/features/show_news/domain/entities/new_info.dart';
import 'package:news_app/core/failure_successes/failures.dart';

abstract class FetchRepo {
  Future<Either<Failure,List<NewsInfo>>> fetchNews(String? searchText);
}