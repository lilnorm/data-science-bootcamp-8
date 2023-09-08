from requests import get
import time

planets = []

for i in range(5):
    url = f"https://swapi.dev/api/planets/{i + 1}"
    resp = get(url)
    if resp.status_code == 200:
        json_data = resp.json()
        planets.append(
            (json_data["name"],
            json_data["climate"],
            json_data["terrain"],
            json_data["population"])
        )

    time.sleep(1)

print("Connect successfully!", resp.status_code)
print(planets)
