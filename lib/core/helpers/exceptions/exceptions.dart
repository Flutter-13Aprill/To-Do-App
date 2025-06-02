class SupabaseRepoException implements Exception{
  const SupabaseRepoException(this.message);
  final String? message;

  @override
  String toString() {
    const result = 'Supabase Repo Exception: ';
    if(message is String){
      return '$result - $message';
    }
    return result;
  }
}