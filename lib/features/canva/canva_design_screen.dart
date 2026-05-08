import 'package:flutter/material.dart';
import 'package:lamlayer/core/theme/custom_colors.dart';
import 'package:lamlayer/features/bottom_nav_bar/bottom_nav_bar_screen.dart';

class CanvaDesignScreen extends StatefulWidget {
  final String? height;
  final String? width;
  final String? color;

  const CanvaDesignScreen({super.key, this.height, this.width, this.color});

  @override
  State<CanvaDesignScreen> createState() => _CanvaDesignScreenState();
}

class _CanvaDesignScreenState extends State<CanvaDesignScreen> {


   bool opacity = false;
   bool replace = false;
   bool color = false;
   bool flip = false;
   bool remove = false;

   late final width = double.tryParse(widget.width!);
   late final height = double.tryParse(widget.height!);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        elevation: 1,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => BottomNavBarScreen()),
                  (r) => false,
                );
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black),
            ),

            SizedBox(
              width: 34,
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/undo.png',
                  width: 22,
                  height: 22,
                ),
              ),
            ),
            const SizedBox(width: 6),
            SizedBox(
              width: 34,
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {},
                icon: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(3.1416),
                  child: Image.asset(
                    'assets/images/undo.png',
                    width: 22,
                    height: 22,
                  ),
                ),
              ),
            ),
            Spacer(),

            ToolCard(
              imagePath: 'assets/images/text.png',
              label: 'Text',

            ),

            ToolCard(
              imagePath: 'assets/images/image.png',
              label: 'Image',
            ),

            ToolCard(
              imagePath: 'assets/images/pencil.png',
              label: 'Draw',
            ),

            ToolCard(
              imagePath: 'assets/images/shapes.png',
              label: 'Shape',
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert, color: Colors.black),
            ),
          ],
        ),
      ),
      backgroundColor: CustomColors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: CustomColors.custom(widget.color!),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color(0x0D000000),
                  blurRadius: 18,
                  spreadRadius: 10,
                  offset: Offset(0, 6),
                ),
                BoxShadow(
                  color: Color(0x0D000000),
                  blurRadius: 18,
                  spreadRadius: 10,
                  offset: Offset(6, 0),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: .end,
            crossAxisAlignment: .center,
            mainAxisSize: .min,
            children: [
              Visibility(
                visible: opacity,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: CustomColors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x0D000000),
                        blurRadius: 18,
                        spreadRadius: 10,
                        offset: Offset(0, 6),
                      ),
                      BoxShadow(
                        color: Color(0x0D000000),
                        blurRadius: 18,
                        spreadRadius: 10,
                        offset: Offset(6, 0),
                      ),
                    ],
                  ),
                  child: Center(child: Text('Opacity'),),
                ),
              ),
              Visibility(
                visible: replace,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: CustomColors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x0D000000),
                        blurRadius: 18,
                        spreadRadius: 10,
                        offset: Offset(0, 6),
                      ),
                      BoxShadow(
                        color: Color(0x0D000000),
                        blurRadius: 18,
                        spreadRadius: 10,
                        offset: Offset(6, 0),
                      ),
                    ],
                  ),
                  child: Center(child: Text('Replace'),),
                ),
              ),
              Visibility(
                visible: color,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: CustomColors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x0D000000),
                        blurRadius: 18,
                        spreadRadius: 10,
                        offset: Offset(0, 6),
                      ),
                      BoxShadow(
                        color: Color(0x0D000000),
                        blurRadius: 18,
                        spreadRadius: 10,
                        offset: Offset(6, 0),
                      ),
                    ],
                  ),
                  child: Center(child: Text('Color'),),
                ),
              ),
              Visibility(
                visible: flip,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: CustomColors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x0D000000),
                        blurRadius: 18,
                        spreadRadius: 10,
                        offset: Offset(0, 6),
                      ),
                      BoxShadow(
                        color: Color(0x0D000000),
                        blurRadius: 18,
                        spreadRadius: 10,
                        offset: Offset(6, 0),
                      ),
                    ],
                  ),
                  child: Center(child: Text('Flip'),),
                ),
              ),
              Visibility(
                visible: remove,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: CustomColors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x0D000000),
                        blurRadius: 18,
                        spreadRadius: 10,
                        offset: Offset(0, 6),
                      ),
                      BoxShadow(
                        color: Color(0x0D000000),
                        blurRadius: 18,
                        spreadRadius: 10,
                        offset: Offset(6, 0),
                      ),
                    ],
                  ),
                  child: Center(child: Text('Remove'),),
                ),
              ),
              Container(
                height: 80,
                width: double.infinity,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: CustomColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0D000000),
                      blurRadius: 18,
                      spreadRadius: 10,
                      offset: Offset(0, 6),
                    ),
                    BoxShadow(
                      color: Color(0x0D000000),
                      blurRadius: 18,
                      spreadRadius: 10,
                      offset: Offset(6, 0),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: .start,
                      crossAxisAlignment: .center,
                      spacing: 10,
                      children: [
                        EditerCard(
                          isTab: opacity,
                          onTap: (){
                            setState(() {
                              opacity = true;
                              replace = false;
                              color = false;
                              flip = false;
                              remove = false;
                            });
                          },
                        ),
                        EditerCard(
                          icon: Icons.change_circle,
                          text: 'Replace',
                          isTab: replace,
                          onTap: (){
                            setState(() {
                              opacity = false;
                              replace = true;
                              color = false;
                              flip = false;
                              remove = false;
                            });
                          },

                        ),
                        EditerCard(
                          icon: Icons.color_lens,
                          text: 'Color',
                          isTab: color,
                          onTap: (){
                            setState(() {
                              opacity = false;
                              replace = false;
                              color = true;
                              flip = false;
                              remove = false;
                            });
                          },

                        ),
                        EditerCard(
                          icon: Icons.flip,
                          text: 'Flip',
                          isTab: flip,
                          onTap: (){
                            setState(() {
                              opacity = false;
                              replace = false;
                              color = false;
                              flip = true;
                              remove = false;
                            });
                          },

                        ),
                        EditerCard(
                          icon: Icons.delete,
                          text: 'Remove',
                          isTab: remove,
                          onTap: (){
                            setState(() {
                              opacity = false;
                              replace = false;
                              color = false;
                              flip = false;
                              remove = true;
                            });
                          },
                        ),
                      ],
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

class ToolCard extends StatelessWidget {
  final String? imagePath;
  final  String? label;
  final void Function()? onTap;
  const ToolCard({super.key, this.imagePath, this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath ?? 'assets/images/pencil.png', width: 20, height: 20),
            const SizedBox(height: 4),
            Text(label ?? 'Label',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class EditerCard extends StatelessWidget {
  final Color? bgColor;
  final IconData? icon;
  final String? text;
  final void Function()? onTap;
  final bool isTab;
  const EditerCard({
    super.key,
    this.bgColor,
    this.icon,
    this.text,
    this.onTap,
    this.isTab = false

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: isTab ? CustomColors.primaryColor.withOpacity(0.8) : CustomColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0x0D000000),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
            BoxShadow(
              color: Color(0x0D000000),
              blurRadius: 5,
              offset: Offset(2, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Icon(icon ?? Icons.opacity_sharp, color: CustomColors.grey,),
            Text(text ?? 'Opacity', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: isTab ? CustomColors.white : CustomColors.grey, fontSize: 10, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
