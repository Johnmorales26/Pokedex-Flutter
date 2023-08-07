import 'dart:convert';

class PokemonPage {
    int? count;
    String? next;
    String? previous;
    List<Result>? results;

    PokemonPage({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
    });

    factory PokemonPage.fromRawJson(String str) => PokemonPage.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PokemonPage.fromJson(Map<String, dynamic> json) => PokemonPage(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class Result {
    String name;
    String url;

    Result({
        required this.name,
        required this.url,
    });

    factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
