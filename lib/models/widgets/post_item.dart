import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PostItem extends StatefulWidget {
  const PostItem({
    Key? key,
    required this.height,
    required this.url,
    required this.avatar,
    required this.fullName,
    required this.caption,
    required this.createdAt,
    required this.tags,
    this.radiusAvatar = 25,
  }) : super(key: key);

  final double height;
  final String url;
  final String? avatar;
  final String fullName;
  final String? caption;
  final DateTime? createdAt;
  final List<String>? tags;
  final double radiusAvatar;

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  late double _height;
  late String _url;
  late String? _avatar;
  late String _fullName;
  late String? _caption;
  late DateTime? _createdAt;
  late List<String>? _tags;
  late double _radiusAvatar;

  @override
  void initState() {
    _height = widget.height;
    _url = widget.url;
    _avatar = widget.avatar;
    _fullName = widget.fullName;
    _caption = widget.caption;
    _createdAt = widget.createdAt;
    _tags = widget.tags;
    _radiusAvatar = widget.radiusAvatar;
    super.initState();
  }

  String _buildTimePost() {
    late String time;
    DateTime now = DateTime.now();
    if (_createdAt == null) {
      time = 'Unknown';
    } else if (now.difference(_createdAt!).inDays > 0) {
      time = '${now.difference(_createdAt!).inDays} days ago';
    } else {
      if (now.difference(_createdAt!).inHours > 0) {
        time = '${now.difference(_createdAt!).inHours} hours ago';
      } else {
        if (now.difference(_createdAt!).inMinutes > 0) {
          time = '${now.difference(_createdAt!).inMinutes} minutes ago';
        } else {
          time = 'A few seconds ago';
        }
      }
    }
    return time;
  }

  String? _buildTags() {
    String? tags;
    if (_tags != null && _tags!.isNotEmpty) {
      tags = '';
      for (int i = 0; i < _tags!.length; i++) {
        if (i != _tags!.length - 1) {
          tags = tags! + '#${_tags![i]}, ';
        } else {
          tags = tags! + '#${_tags![i]}';
        }
      }
    }
    return tags;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFF242A37),
          boxShadow: const [
            BoxShadow(
                color: Colors.black, blurRadius: 15, offset: Offset(0, 0.75))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //infor Widget
          SizedBox(
            child: Row(
              children: [
                CircleAvatar(
                  radius: _radiusAvatar,
                  backgroundColor: Colors.amber,
                  backgroundImage: _avatar != null
                      ? CachedNetworkImageProvider(_avatar!)
                      : null,
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _fullName,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          InkWell(
                            child: const Icon(
                              Icons.more_horiz,
                              color: Color(0xFF4E586E),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                      Text(
                        _buildTimePost(),
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF4E586E),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: _buildTags() != null
                      ? Text(
                          _buildTags()!,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFFF54B64),
                          ),
                        )
                      : null,
                ),
                Text(
                  (_caption != null && _caption != "")
                      ? _caption!
                      : 'No caption',
                  textAlign: TextAlign.start,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          Expanded(
            child: CachedNetworkImage(
              width: double.infinity,
              imageUrl: _url,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ],
      ),
    );
  }
}
