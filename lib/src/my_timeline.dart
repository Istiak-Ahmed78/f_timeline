import 'package:flutter/material.dart';

part 'model/my_time_line_model.dart';

///[BubblePosition] is to define bubbles position
enum BubblePosition {
  middle,
  start,
  end,
}

class FTimeline extends StatefulWidget {
  /// Pass a list of [FTimeLineModel].
  final List<FTimeLineModel> timelines;

  /// There can be several types of [TimeLineState]. You can find them just a bit above.
  final int doneTillIndex;

  const FTimeline(
      {Key? key, required this.timelines, required this.doneTillIndex})
      : assert(doneTillIndex < timelines.length,
            'doneTillIndex cannot be greater than or equal to the length of timelines'),
        super(key: key);

  @override
  State<FTimeline> createState() => _FTimelineState();
}

class _FTimelineState extends State<FTimeline> {
  late ScrollController scrollController = ScrollController();

  @override
  void initState() {
    if (!(widget.doneTillIndex == 0 ||
            widget.doneTillIndex == widget.timelines.length) ||
        !scrollController.hasClients) return;
    scrollController.jumpTo(scrollController.position.maxScrollExtent);

    super.initState();
  }

  Size _getSize(BuildContext context) => MediaQuery.of(context).size;

  Widget _buildBubble(bool _isActive) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _isActive ? Colors.green : Colors.grey,
      ),
      child: const Icon(
        Icons.done,
        color: Colors.white,
      ),
    );
  }

  Widget _buildTimeLineText(String text, bool _isActive) => Text(
        text,
        style: TextStyle(color: _isActive ? Colors.green : Colors.grey),
      );

  Widget _buildConnector(bool _isActive, {double length = 50}) {
    return Container(
      width: length,
      height: 5,
      color: _isActive ? Colors.blue : Colors.grey,
    );
  }

  Widget _buildEveryTile(
      {required FTimeLineModel model,
      required BubblePosition position,
      required bool isActive,
      required bool isFill}) {
    late Widget child;
    switch (position) {
      case BubblePosition.start:
        child = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                _buildBubble(isActive),
                _buildConnector(isFill),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            _buildTimeLineText(model.title, isActive)
          ],
        );
        break;
      case BubblePosition.end:
        child = SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  _buildConnector(isActive),
                  _buildBubble(isActive),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              _buildTimeLineText(model.title, isActive)
            ],
          ),
        );
        break;
      default:
        child = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                _buildConnector(isActive),
                _buildBubble(isActive),
                _buildConnector(isFill),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            _buildTimeLineText(model.title, isActive)
          ],
        );
    }
    return child;
  }

  Widget _buildHeaderPart(
    List<FTimeLineModel> timelines,
    int currentIndex,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        children: List.generate(
          timelines.length,
          (index) => _buildEveryTile(
            model: timelines[index],
            position: getBubblePosition(index, timelines.length),
            isActive: index == currentIndex || index < currentIndex,
            isFill: index < currentIndex,
          ),
        ),
      ),
    );
  }

  BubblePosition getBubblePosition(int currentIndex, int length) {
    if (currentIndex == 0) return BubblePosition.start;
    if (currentIndex == (length - 1)) return BubblePosition.end;
    return BubblePosition.middle;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: Column(children: [
        SizedBox(
          height: _getSize(context).height * 0.13,
          child: _buildHeaderPart(
            widget.timelines,
            widget.doneTillIndex,
          ),
        ),
        SizedBox(
          height: _getSize(context).height * 0.707,
          child: ListView(
            shrinkWrap: true,
            children: [
              widget.timelines[widget.doneTillIndex].content,
            ],
          ),
        ),
      ]),
    );
  }
}
