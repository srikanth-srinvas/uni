from get_foraging_trips import rfid_dict, find_foraging_trips

def test_rfid_dict():
    expect = {'B1': [('03:00:15.615', 'Arriving', '200558')], 'B2': [('03:23:52.834', 'Departing', '200566'), ('03:28:07.912', 'Arriving', '200566')], 'B3': [('08:24:53.099', 'Departing', '200566'), ('08:25:08.177', 'Unknown', '200566'), ('08:35:38.334', 'Arriving', '200566')], 'B4': [('08:36:08.427', 'Departing', '200566'), ('08:54:46.271', 'Arriving', '200558')], 'B5': [('08:41:23.505', 'Unknown', '200566')], 'B6': [('08:53:30.771', 'Unknown', '200558'), ('08:53:45.849', 'Departing', '200558'), ('08:54:00.943', 'Arriving', '200558'), ('08:54:16.052', 'Departing', '200558')]}
    
    output = rfid_dict(open("log_test.txt"))
    
    assert output == expect

test_rfid_dict()

def test_find_foraging_trips():
    test_results = open("foraging_trips_test.csv")
    expect = test_results.readlines()
    bee_dict = rfid_dict(open("log_test.txt"))
    find_foraging_trips(bee_dict)
    output = open("foraging_trips.csv").readlines()

    assert output == expect

test_find_foraging_trips()