import 'package:news_app/core/failure_successes/exceptions.dart';
import 'package:news_app/core/services/api_service.dart';
import 'package:news_app/features/show_news/data/models/news_info_model.dart';
import 'package:news_app/features/show_news/domain/entities/new_info.dart';
import 'package:news_app/core/constants/strings.dart';
import 'package:news_app/core/service_locator.dart';
abstract class FetchFromRemoteDS{

  Future<List<NewsInfoModel>> fetchNews(String? searchText);
}
class FetchFromRemoteDSImpl implements FetchFromRemoteDS{
  late final ApiService apiService=sl<ApiService>();

  @override
  Future<List<NewsInfoModel>> fetchNews(String? searchText) async {
try{
  Map<String,dynamic> data =await apiService.getData(
    searchText != null ? Strings.apiEverything : Strings.apiTopHeadlines,
        {
          'apikey': Strings.apiKey,
        if(searchText ==null) 'country' : 'in',
        if(searchText != null) 'q':searchText,
        }
  );
  // throw UnimplementedError()
  List list =data['article'];
  List<Map<String,dynamic>> mapList =[];
  for (int i =0;i<list.length;i++){
    Map<String,dynamic>map =list[i] as Map<String,dynamic>;
    mapList.add(map);
  }
  List<NewsInfoModel>news =[];
  for(int i=0;i<mapList.length;i++){
    NewsInfoModel newsInfoModel = NewsInfoModel.fromMap((mapList[i]));
    news.add(newsInfoModel);
  }
  return news;
}
catch(e){
  throw FetchException(message:'Failed to get data');
}

  }

}