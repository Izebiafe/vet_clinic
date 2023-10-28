INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES (1, 'Agumon','2020/03/03', 0, true, 10.23),
(2, 'Gabumon','2018/11/15', 2, true, 8),
(3, 'Pikachu','2021/01/07', 1, false, 15.04),
(4, 'Devimon','2017/05/12', 5, true, 11);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES-- Insert the following data into the owners table:

--     Sam Smith 34 years old.
--     Jennifer Orwell 19 years old.
--     Bob 45 years old.
--     Melody Pond 77 years old.
--     Dean Winchester 14 years old.
--     Jodie Whittaker 38 years old.

INSERT INTO owners (full_name, age)
VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

 Insert the following data into the species table:

--     Pokemon
--     Digimon

INSERT INTO species (name)
VALUES
    ('Pokemon'),
    ('Digimon');

-- Modify your inserted animals so it includes the species_id value:

--     If the name ends in "mon" it will be Digimon
--     All other animals are Pokemon

UPDATE animals
SET species_id = CASE
    WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
    ELSE (SELECT id FROM species WHERE name = 'Pokemon')
END;

-- Modify your inserted animals to include owner information (owner_id):

--     Sam Smith owns Agumon.
--     Jennifer Orwell owns Gabumon and Pikachu.
--     Bob owns Devimon and Plantmon.
--     Melody Pond owns Charmander, Squirtle, and Blossom.
--     Dean Winchester owns Angemon and Boarmon.

UPDATE animals
SET owner_id = CASE
    WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
    WHEN name IN ('Gabumon', 'Pikachu') THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
    WHEN name IN ('Devimon', 'Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob')
    WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
    WHEN name IN ('Angemon', 'Boarmon') THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
END;