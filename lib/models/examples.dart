class Example {
  List<int> input;
  List<int> output;

  Example({required this.input, required this.output});

  factory Example.fromJson(Map<String, dynamic> json) => Example(
        input: List<int>.from(json["input"].map((x) => x)),
        output: List<int>.from(json["output"].map((x) => x)),
      );
}
