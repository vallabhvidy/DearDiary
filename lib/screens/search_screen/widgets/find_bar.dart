import 'package:flutter/material.dart';

class FindBar extends StatelessWidget {
  const FindBar({super.key, required this.onChanged});

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      elevation: WidgetStatePropertyAll(0.0),
      onChanged: onChanged,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.search),
      ),
      trailing: [IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt))],
      constraints: BoxConstraints(maxWidth: 600, minHeight: 56.0),
    );
  }
}

// class FindBar extends StatelessWidget {
//   const FindBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: ConstrainedBox(
//         constraints: BoxConstraints(maxWidth: 600),
//         child: Material(
//           color: Theme.of(context).colorScheme.surfaceContainer,
//           borderRadius: BorderRadius.circular(30.0),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(),
//           ),
//         ),
//       ),
//     );
//   }
// }
