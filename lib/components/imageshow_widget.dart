import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'imageshow_model.dart';
export 'imageshow_model.dart';

class ImageshowWidget extends StatefulWidget {
  const ImageshowWidget({
    Key? key,
    this.parameter1,
  }) : super(key: key);

  final List<String>? parameter1;

  @override
  _ImageshowWidgetState createState() => _ImageshowWidgetState();
}

class _ImageshowWidgetState extends State<ImageshowWidget> {
  late ImageshowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageshowModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      height: 250.0,
      decoration: BoxDecoration(),
      child: Builder(
        builder: (context) {
          final images = widget.parameter1?.toList() ?? [];
          return Container(
            width: double.infinity,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _model.pageViewController ??=
                      PageController(initialPage: min(0, images.length - 1)),
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, imagesIndex) {
                    final imagesItem = images[imagesIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'IMAGESHOW_COMP_Image_a4z6spdd_ON_TAP');
                        logFirebaseEvent('Image_expand_image');
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: FlutterFlowExpandedImageView(
                              image: CachedNetworkImage(
                                fadeInDuration: Duration(milliseconds: 500),
                                fadeOutDuration: Duration(milliseconds: 500),
                                imageUrl: imagesItem,
                                fit: BoxFit.contain,
                              ),
                              allowRotation: false,
                              tag: imagesItem,
                              useHeroAnimation: true,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: imagesItem,
                        transitionOnUserGestures: true,
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 500),
                          fadeOutDuration: Duration(milliseconds: 500),
                          imageUrl: imagesItem,
                          height: 250.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 1.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: smooth_page_indicator.SmoothPageIndicator(
                      controller: _model.pageViewController ??= PageController(
                          initialPage: min(0, images.length - 1)),
                      count: images.length,
                      axisDirection: Axis.horizontal,
                      onDotClicked: (i) async {
                        await _model.pageViewController!.animateToPage(
                          i,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      effect: smooth_page_indicator.ExpandingDotsEffect(
                        expansionFactor: 3.0,
                        spacing: 8.0,
                        radius: 16.0,
                        dotWidth: 8.0,
                        dotHeight: 8.0,
                        dotColor: Colors.white,
                        activeDotColor: Color(0xDAFF5963),
                        paintStyle: PaintingStyle.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
