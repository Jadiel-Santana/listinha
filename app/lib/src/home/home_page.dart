import 'package:flutter/material.dart';

import '../shared/components/user_image_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listinha'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: UserImageButton(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                SegmentedButton<int>(
                  segments: const [
                    ButtonSegment(
                      value: 0,
                      label: Text('Todos'),
                    ),
                    ButtonSegment(
                      value: 1,
                      label: Text('Pendentes'),
                    ),
                    ButtonSegment(
                      value: 2,
                      label: Text('Concluídas'),
                    ),
                    ButtonSegment(
                      value: 3,
                      label: Text('Desativados'),
                    ),
                  ],
                  selected: const {0},
                  onSelectionChanged: (value) {},
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nova Lista'),
        icon: const Icon(Icons.edit),
        onPressed: () {},
      ),
    );
  }
}
