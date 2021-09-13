/// Flutter code sample for PageView

// Here is an example of [PageView]. It creates a centered [Text] in each of the three pages
// which scroll horizontally.

import 'package:flutter/material.dart';
import 'package:pageviewdemo/constant.dart';
import 'package:pageviewdemo/description.dart';
import 'package:pageviewdemo/header.dart';
import 'package:pageviewdemo/title.dart';

void main() => runApp( MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      scrollDirection: Axis.vertical,
      controller: controller,
      children:  <Widget>[
        Container(
          child: Expanded(
            child: Column(
              children: [
                kHeaderGap,
                DataTitle(title: 'ডেটা স্ট্রাকচার কী ও কেন?',),
                kTitleGap,
                Description(description: 'তােমাকে বললাম দুই জন ছাত্রের বয়স ইনপুট নিয়ে তাদের বয়সের গড় বের করে দিতে। তুমি সুন্দর মত দুটি ভ্যারিয়েবলে দুজন ছাত্রের বয়স ইনপুট নিয়ে তাদেরকে যোগ করে ২ দিয়ে ভাগ দিয়ে গড় বের করে প্রিন্ট করলে। এখন যদি বলি ৫ জন ছাত্রের বয়সের গড় বের করতে হবে। তাহলে তুমি ৫টা ভ্যারিয়েবল নিয়ে তাতে ইনপুট নিবে তাই না? যদি বলি ১০০ জন ছাত্রের বয়স ইনপুট নিয়ে তাদের গড় বের করতে তাহলে? বা N সংখ্যক ছাত্রের বয়সের গড় বের করতে যেখানে N একটি স্বাভাবিক সংখ্যা যা প্রােগ্রাম রান করার পর ইউজার ইনপুট দিবে। সেক্ষেত্রে কী করবে? তারমানে ইচ্ছা মত অনেক অনেকগুলা ভ্যারিয়েবল ডিক্লেয়ার করে তাতে ডেটা স্টোর করাটা কোন ভাল কাজ না। ডেটাগুলোকে একটা সাজানাে গােছানাে ফরমেটে যদি রাখা যায় তাহলে সেটা নিয়ে কাজ করতে সুবিধা হয়। এই উদাহরণের ক্ষেত্রে সবচেয়ে সহজ ডেটা স্ট্রাকচারটা ব্যবহার করা যায়। যার নাম Array.',),
                kDescriptionGap,
                Description(description: 'আরেকটা উদাহরণের কথা চিন্তা করি। তােমার পিসির My Computer এ ঢুকলে। দেখলে ৩ টা ড্রাইভ আছে। সি ড্রাইভে ঢুকলে। অনেকগুলো ফোল্ডারের মধ্যে একটা ফোল্ডার পেলে Program Files (x86) নামের একটা ফোল্ডার। এই ফোল্ডারের অধীনে রয়েছে তােমার পিসিতে যত অ্যাপ্লিকেশন সফটওয়্যার রয়েছে তাদের ফোল্ডার। ধর CodeBlocks এর ফোল্ডার ওপেন করলা। এর অধীনে আরো কিছু ফোল্ডার পাবে। এরকম ফোল্ডার থেকে ফোল্ডারের ভিতরে ঢুকতে ঢুকতে এক সময় দেখবে আর ফোল্ডার নাই। কোন একটা ফাইল দেখা যাচ্ছে। হয়ত সে ফাইল নিয়ে তুমি কোান কাজ করবে। এখন পুরাে জিনিসটাকে একটা গাছের সাথে কল্পনা কর। ধর My Computer হচ্ছে গাছের শিকড় (root). ৩ টা ড্রাইভ হচ্ছে ৩ টা শাখা। সি ড্রাইভে ঢুকার পর Program Files (x86) একটা প্রশাখা। এই প্রশাখার অধীনে আরাে অনেক প্রশাখা আছে। এরকম ভিতরে ঢুকতে ঢুকতে একদম শেষের ফাইলটা হচ্ছে গাছের পাতা (node). এই যে একটার অধীনে আরেকটা নোড, তার অধীনে আরেকটা নোড এই স্ট্রাকচারটা হচ্ছে Tree Data Structure.',),
                kDescriptionGap,
                Description(description: 'সফটওয়্যার ডেভেলপমেন্ট বা ACM প্রােগ্রামিং কনটেস্ট করার সময় ডেটা স্ট্রাকচার খুবই গুরুত্ব বহন করে। ডেটা স্ট্রাকচারের ভাল ধারণা না থাকলে সফটওয়্যার ডেভেলপমেন্টের অনেক ডীপ লেভেলে কাজ করা মুশকিল হতে পারে।',),
                kTitleGap,
                DataTitle(title: 'ডেটা স্ট্রাকচার কী?',),
                kDescriptionGap,
                Description(description: 'Schaums Outline Series এর Data Structures বইয়ের সংজ্ঞা অনুযায়ী বলা যায়, ডেটাকে অনেক ভাবেই সাজিয়ে রাখা যায়। ডেটা স্ট্রাকচার হচ্ছে ডেটাগুলোকে নির্দিষ্ট পদ্ধতিতে সাজিয়ে রাখার লজিক্যাল বা ম্যাথমেটিক্যাল মডেল।',),
                kDescriptionGap,
                Description(description: 'অর্থাৎ ডেটাকে কম্পিউটার মেমরিতে সংরক্ষণ ও সেগুলোকে নিয়ে প্রসেস করার জন্য efficient পদ্ধতিতে ডেটাগুলােকে organize করার নামই ডেটা স্ট্রাকচার। কোন একটা ডেটা স্ট্রাকচার নিয়ে কাজ করার ক্ষেত্রে দুইটা জিনিস মাথায় রাখতে হয়। প্রথমত, ডেটাগুলাের মধ্যে পারস্পরিক সম্পর্ক বুঝানাের জন্য স্ট্রাকচারের দিক দিয়ে যথেষ্ট সমৃদ্ধ হতে হবে। দ্বিতীয়ত, এটাকে হতে হবে খুব সিম্পল, যেন দরকারের সময় effectively ডেটাগুলোকে নিয়ে কাজ করা যায়।',),
                kTitleGap,
                DataTitle(title: 'ডেটা স্ট্রাকচার কেন শেখা প্রয়ােজন?',),
                kDescriptionGap,
                Description(description: 'আর্টিকেলের শুরুর দুই প্যারা থেকে তুমি সহজেই বুঝে গেছ ডেটা স্ট্রাকচার কেন শেখা প্রয়োজন? প্রথম উদাহরণে সিরিয়াল্যি ডেটাগুলােকে স্টোর করে পরে সেগুলো নিয়ে কাজ করাই যথেষ্ট। কিন্তু দ্বিতীয় উদাহরণে কিন্তু সবগুলা ড্রাইভ-ফোল্ডারের নাম সিরিয়াল্যি রেখে দিলেই এগুলোর মধ্যে root-node এর সম্পর্ক বুঝানাে সম্ভব না। সেজন্য প্রথমটার ক্ষেত্রে simple array ব্যবহার করা হয়েছে আর দ্বিতীয়টার ক্ষেত্রে Tree.',),
                kDescriptionGap,
                Description(description: 'Google এ যখন কোন একটা শব্দ লিখে সার্চ দেয়া শুরু করি তখন কিন্তু ২-১ টা অক্ষর লেখার পরেই অটো সাজেশন দেয়। এটা ইমপ্লিমেন্ট করা যায় Trie Data Structure দিয়ে। যা Tree এরই একটা variation.',),
                kDescriptionGap,
                Description(description:'ধর তােমার কোম্পানী তােমাকে কোন একটা ব্যাংকের সার্ভিস সেন্টারের অটোমেশন সফটওয়্যারের কাজ দিল। যেখানে কাস্টমাররা ব্যাংকে ঢুকেই একটা বুথ থেকে তার টোকেন প্রিন্ট করবে। এরপর ৫-৬ বুথ থেকে কাস্টমারদেরকে ডাকবে সার্ভিস দেয়ার জন্য। তাহলে ১৫ জনের পরে যার টোকেন নাম্বার, তাকে ডাকা হবে এই ১৫ জনের পরেই। তার মানে এখানে Queue Data Structure ইমপ্লিমেন্ট করা হচ্ছে। কোন নতুন কাস্টমার টোকেন প্রিন্ট করলেই তার নাম্বারটা কিউতে ফেলে দেয়া হবে। প্রতিটা বুথ থেকে যখনই কাউকে ডাকা হবে এই কিউয়ের সামনে থেকে ডাকা হবে। অর্থাৎ যে আগে আসবে সে কিউয়ের সামনের দিকে থাকবে।',),
                kDescriptionGap,
                Description(description:'এরকম অসংখ্য উদাহরণ দেয়া যায় ডেটা স্ট্রাকচারের প্র্যাক্টিক্যাল বা রিয়েল লাইফ ইমপ্লিমেন্টেশনের। তাই ACM contest, Web development বা মোবাইল ডেভেলপমেন্ট যে দিকেও যাও না কেন। ব্যাসিক ডেটা স্ট্রাকচার জানা থাকা লাগবেই।',),
                kHeaderGap,
                kHeaderGap,
              ],
            ),
          ),
        ),
        Center(
          child: Text('Second Page'),
        ),
        Center(
          child: Text('Third Page'),
        )
      ],
    );
  }
}
