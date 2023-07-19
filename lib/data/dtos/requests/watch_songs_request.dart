class WatchSongsRequest {
  final String? search;
  final String? sort;
  final String? order;
  final int? page;
  final int? limit;

  const WatchSongsRequest({
    this.search,
    this.sort,
    this.order,
    this.page,
    this.limit,
  });
}
