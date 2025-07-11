import 'package:news_route/Features/articles/domain/entities/source_entity.dart';

class SourceModel extends SourceEntity {
	String? id;
	String? name;
	String? description;
	String? url;
	String? category;
	String? language;
	String? country;

	SourceModel({
		this.id, 
		this.name, 
		this.description, 
		this.url, 
		this.category, 
		this.language, 
		this.country, 
	}) : super(sourceId: id ?? '', sourceName: name ?? '');

	factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
				id: json['id'] as String?,
				name: json['name'] as String?,
				description: json['description'] as String?,
				url: json['url'] as String?,
				category: json['category'] as String?,
				language: json['language'] as String?,
				country: json['country'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'description': description,
				'url': url,
				'category': category,
				'language': language,
				'country': country,
			};
}
