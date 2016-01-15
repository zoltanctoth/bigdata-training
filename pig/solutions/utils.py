@outputSchema("region:chararray")
def get_region(city):
    if city == "Budapest":
        return "Budapest"
    elif city == "Debrecen":
        return "Hajdu-Bihar"
    elif city in ["Sopron", "Gyor"]:
        return "Gyor-Moson-Sopron"
    else:
        return None
