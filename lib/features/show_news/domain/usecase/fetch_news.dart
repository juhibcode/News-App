import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/core/failure_successes/failures.dart';
import 'package:news_app/features/show_news/domain/entities/new_info.dart';
import 'package:news_app/features/show_news/domain/repositories/fethch_repo_contract.dart';
import 'package:news_app/core/service_locator.dart';

class FetchNewsUsecase {
  final FetchRepo fetchRepo= sl<FetchRepo>();

  Future<Either<Failure,List<NewsInfo>>> fetchnews(String? searchText){
     return fetchRepo.fetchNews(searchText);
  }
}