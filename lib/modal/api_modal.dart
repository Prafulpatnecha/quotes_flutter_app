

class ApiModal
{
  late String quote,author,category;

  ApiModal({required this.quote,required this.author,required this.category});
  factory ApiModal.fromJson(Map m1)
  {
    return ApiModal(quote: m1['quote'], author: m1['author'], category: m1['category']);
  }
}