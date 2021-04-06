import 'package:yandra_app/models/service.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final Service service;

  const ServiceCard({Key key, this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        child: Column(
          children: [
            Container(
              height: 150,
              child: Image.network(
                service.photo,
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
                      Text(service.time),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(Icons.attach_money),
                      Text(service.price.toString()),
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
              child: Text(service.resume),
            ),
            Container(
              height: 15,
            ),
            Center(
              child: Text(
                service.name,
                style: TextStyle(
                    fontSize: 20, color: Theme.of(context).primaryColor),
              ),
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
