// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a messages locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'messages';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "attendance" : MessageLookupByLibrary.simpleMessage("Attendance"),
    "contacts" : MessageLookupByLibrary.simpleMessage("Contacts"),
    "language" : MessageLookupByLibrary.simpleMessage("ع ر"),
    "links" : MessageLookupByLibrary.simpleMessage("Links"),
    "login" : MessageLookupByLibrary.simpleMessage("Login"),
    "not_valid_username" : MessageLookupByLibrary.simpleMessage("Not Valid Username"),
    "password" : MessageLookupByLibrary.simpleMessage("password"),
    "password_is_too_short" : MessageLookupByLibrary.simpleMessage("password is too short"),
    "profile" : MessageLookupByLibrary.simpleMessage("Profile"),
    "support" : MessageLookupByLibrary.simpleMessage("Support"),
    "title" : MessageLookupByLibrary.simpleMessage("Home"),
    "username" : MessageLookupByLibrary.simpleMessage("Username")
  };
}
