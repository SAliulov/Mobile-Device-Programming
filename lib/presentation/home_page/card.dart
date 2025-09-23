part of 'home_page.dart';

typedef OnLikeCallback = void Function(String title, bool isLiked)?;

class _Card extends StatefulWidget {
  final String title;
  final String subtitle;
  final String? imageUrl;
  final OnLikeCallback onLike;
  final VoidCallback? onTap;

  const _Card(this.title, {required this.subtitle, this.imageUrl, this.onLike, this.onTap});

  factory _Card.fromData(EmojiCardData data, {OnLikeCallback onLike, VoidCallback? onTap,}) => _Card(
    data.title,
    subtitle: data.subtitle,
    imageUrl: data.imageURL,
    onLike: onLike,
    onTap: onTap,
  );

  @override
  State<_Card> createState() => _CardState();
}

class _CardState extends State<_Card> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        constraints: const BoxConstraints(minHeight: 140),
        padding: const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 30),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              spreadRadius: 4,
              offset: const Offset(0, 5),
              blurRadius: 0,
            ),
          ],
        ),

        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: SizedBox(
                  height: 150,
                  width: 140,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          widget.imageUrl ?? '',
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Placeholder(),
                        ),
                      ),

                      // Align(
                      //   alignment: Alignment.bottomLeft,
                      //   child: Container(
                      //     decoration: const BoxDecoration(
                      //       color: Colors.orangeAccent,
                      //       borderRadius: BorderRadius.only(
                      //         topRight: Radius.circular(20),
                      //       ),
                      //     ),
                      //     padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                      //     child: Text(
                      //       style: TextStyle(fontFamily: 'ClashRoyaleRegular'),
                      //       'Допустимый урон',
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),

              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontFamily: 'ClashRoyaleBold',
                          color: Colors.black,
                          fontSize: 32,
                        ),
                      ),
                      Text(
                        widget.subtitle,
                        style: const TextStyle(
                          fontFamily: 'ClashRoyaleRegular',
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0, top: 8),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 16,
                      bottom: 8,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                        widget.onLike?.call(widget.title, isLiked);
                      },
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: isLiked
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.redAccent,
                                key: ValueKey<int>(0),
                              )
                            : const Icon(
                                Icons.favorite_border,
                                key: ValueKey<int>(1),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
