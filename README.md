# weatherterminal

A simple bash application to get weather results for any city and or region in the terminal. 
Requires bash, jq and curl.

This script can be integrated with other applications, discord bots, etcetera


## Example Discord bot integration:

1. Create a variable clima_path with the path to the bash script
2. If the path is relative to the dir where this script runs, make sure you have ```import os``` on your python scirpt

```
@bot.command(name='clima')
async def get_clima(ctx, *args):
    location = ' '.join(args)
    try:
        clima_output = subprocess.check_output(['/bin/bash', clima_path, *args], text=True)
        await ctx.send(f'{clima_output}')
    except subprocess.CalledProcessError as e:
        print(e)
        await ctx.send('Alexia se debe haber mandado alguna cagada pq esto no funca')
```

## Questions, patches and issues

Please open an issue here on github and I will look at it. 

## Documentation

https://alexia.lat

## About the author

https://lexi.lat/lexi


