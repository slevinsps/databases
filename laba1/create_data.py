import pandas
import random
from random import choice
import string

def format_age(age):
    if pandas.isnull(age):
        return 'Null'
    else:
        return int(round(age))


def format_ticket(ticket):
    ticket = ticket.split(' ')
    if len(ticket) == 1:
        try:
            return int(ticket[0])
        except ValueError:
            return 'Null'
    else:
        try:
            return int(ticket[len(ticket)-1])
        except ValueError:
            return 'Null'


def format_sur(sur):
    if sur:
        return 'TRUE'
    else:
        return 'FALSE'
    
def get_random_from_list(a):
    return random.choice(a)

def get_word(begin, end):
    k = random.randint(begin, end)
    first_letter = ''.join(choice(string.ascii_uppercase))
    other = ''.join(choice(string.ascii_lowercase) for i in range(k -1))
    return first_letter + other

def get_number(begin, end):
    return random.randint(begin, end)
	
arr_par_com = []
def get_array_par():
	par_com = 0
	ind_par_com = 1
	
	for i in range(1, 101):
		if par_com > 3:
			ind_par_com += 1
			par_com = 1
		arr_par_com.append(ind_par_com)
		par_com += 1
get_array_par()
random.shuffle(arr_par_com)

print(arr_par_com	)
def get_number_par_com(begin, end):
	return random.randint(begin, end)
		
	
def get_data():
    return str(random.randint(1926, 2000))+'0'+str(random.randint(1, 9))+str(random.randint(10, 25))
num_film = 101
num_actor = 101
num_studio = 101
def create_film_csv(genres, countries):
    p = open('film.csv', 'w')
    p.write("Id,Title,Genre,Country,Year,Budget,Gross\n")
    for i in range(1, num_film):
        string_to_write = "{0},{1},{2},{3},{4},{5},{6}\n".format(i,
                                                             get_word(5, 15),
                                                             get_random_from_list(genres),
                                                             get_random_from_list(countries),
                                                             get_number(1925, 2018),
                                                             get_number(10, 200),
                                                             get_number(1, 1000)
                                                             )
        string_to_write = string_to_write.replace(", ", " ")
        string_to_write = string_to_write.replace("Null", "")
        p.write(string_to_write)
    p.close()
    
def create_actor_csv(firstname, secondname):
    p = open('actor.csv', 'w')
    p.write("Id,Name,Birthdate,Rating,Еxperience\n")
    for i in range(1, num_actor):
        string_to_write = "{0},{1},{2},{3},{4}\n".format(i,
                                                             get_random_from_list(firstname) + ' ' + get_random_from_list(secondname),
                                                             get_data(),
                                                             get_number(1, 100),
                                                             get_number(1, 50)
                                                             )
        string_to_write = string_to_write.replace(", ", " ")
        string_to_write = string_to_write.replace("Null", "")
        p.write(string_to_write)
    p.close()

def create_studio_csv(countries):
    p = open('studio.csv', 'w')
    p.write("Id,Name,Country,Owner,Employees_number,Parent_company\n")
    for i in range(1, num_studio):
        string_to_write = "{0},{1},{2},{3},{4},{5}\n".format(i,
                                                             get_word(5, 14),
                                                             get_random_from_list(countries),
                                                             get_word(7, 14),
                                                             get_number(500, 15000),
															 arr_par_com[i-1]
                                                             )
        string_to_write = string_to_write.replace(", ", " ")
        string_to_write = string_to_write.replace("Null", "")
        p.write(string_to_write)
    p.close()

def create_contract_csv():
    p = open('contract.csv', 'w')
    p.write("Id,Actor,Film,Fee,Work_days,Studio\n")
    for i in range(1, 101):
        string_to_write = "{0},{1},{2},{3},{4},{5}\n".format(i,
                                                             get_number(1, num_actor),
                                                             get_number(1, num_film),
                                                             get_number(10000, 50000000),
                                                             get_number(10, 100),
                                                             get_number(1, num_studio)
                                                             )
        string_to_write = string_to_write.replace(", ", " ")
        string_to_write = string_to_write.replace("Null", "")
        p.write(string_to_write)
    p.close()

def generate():
    genres = ['Comedy', 'Action', 'Adventure', 'Drama', 'Political', 'Satire', 'Thriller', 'Western', 'Historical', 'Fantasy', 'Social', 'Urban']
    countries = ['Russia', 'USA', 'UK', 'Greece', 'Spain', 'Mexico', 'Ukraine', 'Japan', 'Montenegro', 'SAR', 'Brazil', 'Makedonia']
    firstname = ['Ivan', 'Jack', 'Harry', 'Leo', 'Oliver', 'Henry', 'Max', 'Adam', 'Toby', 'Arthur', 'Lucas', 'Samuel', 'Rodger', 'Rudy', 'Jimmy']
    secondname = ['Smith', 'Johnson', 'Jones', 'Thompson', 'Green', 'Baker', 'Brown', 'Jackson', 'King', 'Phillips', 'Moore', 'Hill', 'Milcovic', 'Padaleci', 'White']
    #create_film_csv(genres, countries)
    #create_actor_csv(firstname, secondname)
    create_studio_csv(countries)
    #create_contract_csv()
    
    #raw_data = pandas.read_csv('titanic.csv')
    #size = raw_data['PassengerId'].count()
    # print(raw_data.head())

    # Generate passengers table as P with PassengerId, Name, Sex, Age

    


if __name__ == "__main__":
    
    generate()
