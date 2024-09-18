import 'package:flutter/material.dart';

import '../model/blog.dart';


class BlogView extends StatelessWidget {
  final Blog blog;

  const BlogView({
    super.key,
    required this.blog,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.network(
          blog.image,
          height: 150,
          width: 150,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  blog.title,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(blog.body)
              ],
            )
        )
      ],
    );
  }
}
