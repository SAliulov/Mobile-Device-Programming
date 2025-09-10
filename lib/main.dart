import 'dart:math';

enum Mood { happy, sleepy, hungry, playful }

class Animal {
  final String name;
  final String species;
  Mood mood;
  int energy;

  Animal(this.name, this.species, this.mood, this.energy);

  void updateMood() {
    if (energy > 70) {
      mood = Mood.playful;
    } else if (energy > 40) {
      mood = Mood.happy;
    } else if (energy > 10) {
      mood = Mood.sleepy;
    } else {
      mood = Mood.hungry;
    }
  }

  void play() {
    energy -= Random().nextInt(20) + 10;
    if (energy < 0) energy = 0;
    updateMood();
  }

  @override
  String toString() {
    return '$name the $species is feeling ${mood.name} with energy $energy.';
  }
}

extension MostEnergetic on List<Animal> {
  Animal? get mostEnergetic {
    if (isEmpty) return null;
    Animal maxAnimal = this[0];

    for (var animal in this) {
      if (animal.energy > maxAnimal.energy) {
        maxAnimal = animal;
      }
    }
    return maxAnimal;
  }
}

Future<List<Animal>> adoptAnimals() async {
  await Future.delayed(Duration(seconds: 2));

  return [
    Animal('Leo', 'Lion', Mood.happy, 80),
    Animal('Bella', 'Bird', Mood.playful, 90),
    Animal('Max', 'Dog', Mood.sleepy, 50),
    Animal('Eugene', 'Cat', Mood.hungry, 20),
  ];
}

void main() async {
  print('Adopting animals from the shelter... Please wait!');

  List<Animal> animals = await adoptAnimals();

  print('\nAnimals adopted:');

  animals.sort((a, b) => b.energy.compareTo(a.energy));

  for (final animal in animals) {
    print(animal);
    animal.play();
    print('After playing: $animal\n');
  }

  var energeticOne = animals.mostEnergetic;
  if (energeticOne != null) {
    print('The most energetic animal now is: $energeticOne');
  }
}
