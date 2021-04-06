/*//this function is still a async function meaning that it will not block other
  //code where ever its executed.
  void data() async {
    // here the code flow will stop here and wait to fetch the data for username
    // and the flow of code will continue to next statement and then wait for bio
    // after that the third statement will be executed.
    // this approach is efficient and useful when one piece of code(or data) is dependent to other
    // like here bio depends on username and then finally the statement 3 that contains
    // both username and bio is dependent for both including bio to print the data.
    //simulate the network request for a username
    //so here 3rd statement exactly takes 5 sec (3+2) to execute after getting required data.
    String username = await Future.delayed(Duration(seconds: 3), () {
      return 'Muazzay';
    });

    //simulate the network request for bio
    String bio = await Future.delayed(Duration(seconds: 2), () {
      return 'overthinker, tall, coder, tech enthusiest, cosmos lover';
    });

    print('$username - $bio');
  }

  @override
  void initState() {
    super.initState();
    data();
    print(
        'this statement is proof that our data function is asynchronous function even tho inside that functon there are some sync functions');
  }*/
// always use 'get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));' cuz only this works in
// newer version of fluter
