import 'package:yandra_app/models/service.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatefulWidget {
  final Service service;
  const ServiceCard({required this.service});

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  @override
  Widget build(BuildContext context) {
    bool _checkbox = false;

    void _checkedService(bool newValue) => setState(() {
          _checkbox = newValue;

          setState(() => _checkbox = !_checkbox);
        });

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        child: Column(
          children: [
            Container(
              height: 150,
              child: Image.network(
                widget.service.photo,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.alarm),
                      ),
                      Text(widget.service.time),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(Icons.attach_money),
                      Text(widget.service.price.toStringAsFixed(2))
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.service.resume),
            ),
            Container(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //To do
                Checkbox(
                  activeColor: Theme.of(context).primaryColor,
                  value: _checkbox,
                  onChanged: (value) => _checkedService(value!),
                ),
                Text(
                  widget.service.name,
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).primaryColor),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.expand_less),
                ),
              ],
            ),
            Container(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
