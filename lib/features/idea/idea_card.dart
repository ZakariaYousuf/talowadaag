import 'package:app/widgets/user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth/models/user_model.dart';

class IdeaCard extends StatefulWidget {
  final String content;
  final List<String>? images;
  final int upVoted;
  final int downVoted;
  final UserModel owner;

  const IdeaCard(
      {super.key,
      required this.content,
      this.images,
      required this.upVoted,
      required this.downVoted,
      required this.owner});

  @override
  State<IdeaCard> createState() => _IdeaCardState();
}

class _IdeaCardState extends State<IdeaCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      color: Colors.white,
      child: Column(
        children: [
          _header(),
          // _content(),
        ],
      ),
    );
  }

  Padding _content() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            _contentText(),
            const SizedBox(
              height: 10,
            ),
            _footer()
          ],
        ),
      ),
    );
  }

  Text _contentText() {
    return const Text(
        "simply dummy text of the printing and typesetting industry. "
        "Lorem Ipsum has been the industry's standard dummy text ever "
        "since the 1500s");
  }

  Row _footer() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2),
          // width: 150,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  print("Touched");
                },
                icon: Row(
                  children: [
                    // Icon( /MdiIcons.handshake),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text("Ku raac")
                  ],
                ),
              ),
              const VerticalDivider(),
              IconButton(
                onPressed: () {
                  print("Disliked");
                },
                icon: const Icon(Icons.thumb_down_off_alt_outlined),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ListTile _header() {
    return ListTile(
      leading: Profile(
        profile: widget.owner.profilePhoto,
        radius: 20,
        isNetwork: true,
      ),
      title: Row(
        children: [
          Flexible(
            child: Text(
              widget.owner.fullName,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "Follow",
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(color: Theme.of(context).primaryColor),
          ),
        ],
      ),
      subtitle: Text('Telesom company',
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(overflow: TextOverflow.ellipsis)),
      trailing: const Icon(Icons.close),
    );
  }
}
