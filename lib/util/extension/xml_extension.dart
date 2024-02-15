import 'package:xml/xml.dart';

extension XMLExtension on XmlElement {
  String? getElementValue(String elementName) => getElement(elementName)?.innerText;
}
