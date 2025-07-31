FROM apache/superset:5.0.0

# Copy superset_config.py to the correct location
COPY superset_assets/superset_config.py /app/superset_home/assets/superset_config.py

# Copy the custom logo to static assets
COPY superset_assets/my_logo.png /app/superset/static/assets/my_logo.png