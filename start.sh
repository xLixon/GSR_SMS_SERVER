screen -dmS weblistener python3 listener/listener.py
screen -dmS ATScreen bash module/at_screen.sh
screen -dmS IPUpdater bash utils/ip.sh
screen -ls