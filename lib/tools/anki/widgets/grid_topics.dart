import 'package:academia/exports/barrel.dart';
import 'package:academia/tools/anki/controllers/controllers.dart';
import 'package:academia/tools/anki/models/models.dart';
import 'package:academia/tools/anki/pages/flashcards.dart';

class GridViewTopic extends StatelessWidget {
  const GridViewTopic({
    super.key,
    required this.idx,
    required this.topicId,
    required this.topic,
    required this.topicDesc,
    required this.isFavourite,
    this.controller,
  });

  final int idx;
  final int topicId;
  final String topic;
  final String topicDesc;
  final bool isFavourite;
  final TopicController? controller;

  @override
  Widget build(BuildContext context) {
    var colorDet = idx % 4;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (builder) => TopicFlashCards(
            topicId: idx,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: colorDet == 0
              ? const Color(0xff8999aa)
              : colorDet == 1
                  ? const Color(0xffffcdfe)
                  : colorDet == 2
                      ? const Color(0xffffe7cd)
                      : const Color(0xffcdffce),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                topic,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                topicDesc,
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.2,
                child: Row(
                  children: [
                    // favourite a topic
                    GestureDetector(
                      onTap: () async {
                        // create a topic object
                        AnkiTopic topic = AnkiTopic(
                          id: idx,
                          name: this.topic,
                          desc: topicDesc,
                          isFavourite: isFavourite,
                        );
                        await controller?.favouriteTopic(topic);
                        // update favourites and all topics
                        await controller?.getAllFavourites();
                        await controller?.getAllTopics();
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: !isFavourite
                                ? const Text("Topic Successfully Favourited")
                                : const Text("Topic Successfully Unfavourited"),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      child: Icon(
                        isFavourite ? Icons.star : Icons.star_border_outlined,
                        size: MediaQuery.of(context).size.height * 0.035,
                      ),
                    ),
                    // delete for topics
                    GestureDetector(
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: const Text(
                            "Are You Sure You Want To Delete Topic?",
                          ),
                          actions: [
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor: WidgetStatePropertyAll(
                                  lightColorScheme.error,
                                ),
                              ),
                              onPressed: () async {
                                AnkiTopic topic = AnkiTopic(
                                  id: idx,
                                  name: this.topic,
                                  desc: topicDesc,
                                );
                                bool? deleted =
                                    await controller?.deleteTopic(topic);
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: (deleted != null && deleted)
                                        ? const Text(
                                            "Topic Successfully Deleted")
                                        : const Text(
                                            "Something happened! Kindly Retry!!"),
                                    duration: const Duration(seconds: 1),
                                  ),
                                );
                                // update favourites and all topics
                                await controller?.getAllFavourites();
                                await controller?.getAllTopics();
                                // ignore: use_build_context_synchronously
                                Navigator.of(context).pop();
                              },
                              child: const Text("Yes"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("No"),
                            ),
                          ],
                        ),
                      ),
                      child: Icon(
                        Icons.delete,
                        size: MediaQuery.of(context).size.height * 0.035,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}