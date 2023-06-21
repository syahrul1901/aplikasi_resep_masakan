import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class DetailScreen extends StatefulWidget {
  final String? title;
  final String? chef;
  final String? ingredients;
  final String? steps;
  final String? imgUrl;
  final int? duration;
  final String? category;
  final String? videoUrl;
  String? isFavorite;

  DetailScreen({
    this.title,
    this.chef,
    this.imgUrl,
    this.ingredients,
    this.duration,
    this.steps,
    this.category,
    this.videoUrl,
    this.isFavorite,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  ChewieController? _chewieController;
  VideoPlayerController? _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl!);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      autoPlay: false,
      looping: false,
    );
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _videoPlayerController?.dispose();
    super.dispose();
  }

  // Tambahkan kode lainnya seperti yang telah Anda tentukan sebelumnya

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrollable) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200,
              titleSpacing: 2.0,
              centerTitle: true,
              pinned: true,
              floating: true,
              backgroundColor: Colors.amber,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  widget.title!,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                background: Image.network(
                  widget.imgUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Bahan-Bahan',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              _buildContainer(
                Text(
                  widget.ingredients!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Video Tutorial',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              _buildVideoPlayer(),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Steps',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              _buildContainer(
                Text(
                  widget.steps!,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              const SizedBox(
                  height: 20), // Berikan sedikit ruang di bagian bawah
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideoPlayer() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Chewie(
        controller: _chewieController!,
      ),
    );
  }

  // Tambahkan kode lainnya seperti yang telah Anda tentukan sebelumnya

  Widget _buildContainer(Widget child) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.black54,
        border: Border.all(color: Colors.grey),
      ),
      width: double.infinity,
      child: child,
    );
  }
}
