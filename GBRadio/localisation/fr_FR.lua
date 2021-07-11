GBRadio_Colour          = {};
GBRadio_Localisation    = {};

GBRadio_Version_String = "GBRadio - " .. GBRadio_VERSION;

-- LOCALISATION.LUA
GBRadio_Colour.Error       = ""--"|cFFFF0000";
GBRadio_Colour.Notice      = ""--"|cFF00C0FF";
GBRadio_Colour.PlayerName  = ""--"|cFF00FF00";
GBRadio_Colour.GBRadioName = ""--"|cFF00C0FF";

GBRadio_Localisation.LOCALE                          = "fr_FR";

GBRadio_Localisation.CMD                             = "/gbr activate";

GBRadio_Localisation.PREFIX_MESSAGE                  = "|r[" .. GBRadio_Colour.GBRadioName .. "%s|r]";
GBRadio_Localisation.PREFIX_FREQUENCY                = "|r[@" .. GBRadio_Colour.GBRadioName .. "%s|r]";
GBRadio_Localisation.PREFIX_PLAYER_NAME              = "|r[" .. GBRadio_Colour.GBRadioName .. "\124Hplayer:%s\124h%s\124h|r]";

GBRadio_Localisation.PREFIX_META_GAMING              = "";
GBRadio_Localisation.PREFIX_ERROR                    = "|r[" .. GBRadio_Colour.Error .. "ERROR|r]";

GBRadio_Localisation.SPLIT_DELIMITER                 = " -- ";
GBRadio_Localisation.SEPERATOR                       = "--------------------------------------------------------------------------";

GBRadio_Localisation.NOTICE_RADIO_ON                 = GBRadio_Localisation.PREFIX_MESSAGE .. " Votre %s grésille brièvement en s'activant.";
GBRadio_Localisation.NOTICE_RADIO_OFF                = GBRadio_Localisation.PREFIX_MESSAGE .. " Votre %s se fait silencieux alors que vous le désactivez.";
GBRadio_Localisation.NOTICE_OUT_OF_RANGE             = GBRadio_Localisation.PREFIX_MESSAGE .. " Votre %s est mortellement silencieux... Il semblerait que vous soyez trop loin du transmetteur le plus proche!"

GBRadio_Localisation.NOTICE_TRANSMITTER_ON           = GBRadio_Localisation.PREFIX_MESSAGE .. " Votre %s utilise désormais le mode transmetteur.";
GBRadio_Localisation.NOTICE_TRANSMITTER_OFF          = GBRadio_Localisation.PREFIX_MESSAGE .. " Votre %s n'utilise plus le mode transmetteur.";

GBRadio_Localisation.NOTICE_CLOSEST_TRANSMITTER      = GBRadio_Localisation.PREFIX_MESSAGE .. " Le transmetteur le plus proche est à environ %s, aux coordonnées %s.";

GBRadio_Localisation.NOTICE_RADIO_IS_OFF             = GBRadio_Localisation.PREFIX_MESSAGE .. " Vous remarquez que votre %s n'est pas allumé. Activez le avec " .. GBRadio_Localisation.CMD;

GBRadio_Localisation.MSG_RECEIVE_META_GAMING_ON      = GBRadio_Localisation.PREFIX_FREQUENCY .. GBRadio_Localisation.PREFIX_PLAYER_NAME .. ": %s";
GBRadio_Localisation.MSG_RECEIVE_META_GAMING_OFF     = GBRadio_Localisation.PREFIX_FREQUENCY .. ": %s";

GBRadio_Localisation.EMOTE_RECEIVE_MESSAGE_HIDDEN    = " attrape son %s qui %s alors qu'il reçoit un message.";    -- format: device name, random string(Crackles|Hisses|Whirrs|Buzzes|etc.)
GBRadio_Localisation.EMOTE_RECEIVE_MESSAGE_VISIBLE   = " attrape son %s qui %s alors qu'il reçoit ce message: ";   -- format: device name, random string(Crackles|Hisses|Whirrs|Buzzes|etc.), message

GBRadio_Localisation.EMOTE_SEND_MESSAGE_HIDDEN       = "murmure quelque chose dans %s %s.";                         -- format: Gender, device name
GBRadio_Localisation.EMOTE_SEND_MESSAGE_VISIBLE      = "parle dans %s %s" .. GBRadio_Localisation.SPLIT_DELIMITER;  -- format: Gender, device name

GBRadio_Localisation.HISTORY_TITLE                   = GBRadio_Colour.Notice .. "# Affichage de l'historique de communication pour %s";
GBRadio_Localisation.HISTORY_SUMMARY                 = GBRadio_Colour.Notice .. "# %s de %s lignes possibles écrites";

GBRadio_Localisation.ERROR_MSG_RECEIVE               = GBRadio_Localisation.PREFIX_MESSAGE .. GBRadio_Localisation.PREFIX_ERROR .. " Votre %s bourdonne en décodant un message!";

GBRadio_Localisation.IDENTIFY_CHAT_FRAME             = GBRadio_Localisation.PREFIX_MESSAGE .. GBRadio_Colour.Notice .. " IDENTIFICATION - Ceci est la fenêtre de chat %s";

GBRadio_Localisation.SET_FREQUENCY					 = GBRadio_Localisation.PREFIX_MESSAGE .. " Vous changez la fréquence de votre %s sur : %s.";

GBRadio_Localisation.STATIC                          = " *Grésillements* ";
GBRadio_Localisation.STATIC_SOUND                    = " *brzz* ";

GBRadio_Localisation.POSSESSIVE_GENDER               = { "son", "son", "son" };

-- Options localisation

GBRadio_Localisation.OPTION_NAME_name = [[Nom de l'appareil]]
GBRadio_Localisation.OPTION_DESC_name = [[Le nom de votre appareil de communication

Note: Ce nom est utilisé dans les émotes et les messages pour décrire votre appareil.]];

GBRadio_Localisation.OPTION_NAME_channelprefix = [[Fréquences de communication]]
GBRadio_Localisation.OPTION_DESC_channelprefix = [[Vos fréquences de communication vous permettent de recevoir et envoyer des communications à d'autres personnes utilisant la même fréquence.

Note : Veuillez séparer chaque fréquence sur une nouvelle ligne.]];

GBRadio_Localisation.OPTION_NAME_primaryfrequency = [[Fréquence de communication primaire]]

GBRadio_Localisation.OPTION_NAME_msgsenddelay = [[Délai d'envoi de message]]
GBRadio_Localisation.OPTION_DESC_msgsenddelay = [[Délai (en secondes) entre le message en /dire et l'envoi sur la fréquence de comm.

NOTE: Si cette option est trop basse, vous risquez d'envoyer le message sur la fréquence avant de l'avoit dit en /dire.]]

GBRadio_Localisation.OPTION_NAME_outputchatframe = [[Fenêtre de discussion]]
GBRadio_Localisation.OPTION_DESC_outputchatframe = [[Sélectionne sur quelle fenêtre de chat seront envoyés les discussions

Note: Le chiffre doit être valide ou les messages ne s'afficheront pas.

Trouvez les ID de fenêtre de chat avec le bouton d'itenfication des fenêtres de discussion.]]

GBRadio_Localisation.OPTION_NAME_outputchatframeidentify = [[Identifer les fenêtres de discussion]]
GBRadio_Localisation.OPTION_DESC_outputchatframeidentify = [[Cliquer affichera un message sur chacune de vos fenêtres de chat afin de les identifier.]]

GBRadio_Localisation.OPTION_NAME_chatmessagecolour = [[Couleur du message]]
GBRadio_Localisation.OPTION_DESC_chatmessagecolour = [[Set la couleur du texte]]

GBRadio_Localisation.OPTION_NAME_squelchtimer = [[Anti-Spam]]
GBRadio_Localisation.OPTION_DESC_squelchtimer = [[Empêche les émotes et sons d'êtres vus/entendus pendant le temps spécifié, à partir de la dernière émote affiché. Cette option évite le spam sur les fréquences chargées.]]

GBRadio_Localisation.OPTION_NAME_speech = [[Discussion]]
GBRadio_Localisation.OPTION_DESC_speech = [[Mets automatiquement les messages en /dire quand vous les envoyez.]]

GBRadio_Localisation.OPTION_NAME_emotes = [[Emotes de réception]]
GBRadio_Localisation.OPTION_DESC_emotes = [[Affiche une émote quand vous recevez un message.

Note: Désactiver cette option désacivera aussi les sons de réception, même si l'option est activée.]]

GBRadio_Localisation.OPTION_NAME_sendemotes = [[Emotes d'envoi]]
GBRadio_Localisation.OPTION_DESC_sendemotes = [[Affiche une émote quand vous envoyez un message.]]

GBRadio_Localisation.OPTION_NAME_redactedemotes = [[Emotes censurées]]
GBRadio_Localisation.OPTION_DESC_redactedemotes = [[Censure le message reçu d'autres joueurs de vos émotes de réception.]]

GBRadio_Localisation.OPTION_NAME_panicemotes = [[Panic emote]]
GBRadio_Localisation.OPTION_DESC_panicemotes = [[Affiche une emote quand vous utilisez le Panic Button]]

GBRadio_Localisation.OPTION_NAME_metagaming = [[Mode Meta]]
GBRadio_Localisation.OPTION_DESC_metagaming = [[Affiche le pseudo des joueurs sur les fréquences.]]

GBRadio_Localisation.OPTION_NAME_showtrp3names = [[Noms TRP3]]
GBRadio_Localisation.OPTION_DESC_showtrp3names = [[Affiche le nom TRP3 des joueurs plutôt que leur pseudo.]]

GBRadio_Localisation.OPTION_NAME_deviceemotenoises = [[Sons de l'appareil]]
GBRadio_Localisation.OPTION_DESC_deviceemotenoises = [[Ces mots seront utilisés automatiquement par les emotes pour décrire le son émis par votre appareil.
Séparez chaque mot sur une nouvelle ligne.
Nécessite au moins 4 mots.]]

GBRadio_Localisation.OPTION_NAME_emotereceive = [[Emote de réception]]
GBRadio_Localisation.OPTION_DESC_emotereceive = [[Cette émote sera utilisée lorsque vous recevrez un message, et que l'option Emotes censurées est désactivée.]]

GBRadio_Localisation.OPTION_NAME_emotereceivehidden = [[Emote de réception censurée]]
GBRadio_Localisation.OPTION_DESC_emotereceivehidden = [[Cette émote sera utilisée lorsque vous recevrez un message, et que l'option Emotes censurées est activée.]]

GBRadio_Localisation.OPTION_NAME_emotesend = [[Emote d'envoi]]
GBRadio_Localisation.OPTION_DESC_emotesend = [[Cette émote sera utilisée quand vous envoyez un message, et avez l'option Discussion activée.]]

GBRadio_Localisation.OPTION_NAME_emotesendhidden = [[Emote d'envoi sans discussion]]
GBRadio_Localisation.OPTION_DESC_emotesendhidden = [[Cette émote sera utilisée quand vous envoyez un message, et avez l'option Discussion désactivée.]]

GBRadio_Localisation.OPTION_NAME_panicbuttonemote = [[Emote du Panic Button]]
GBRadio_Localisation.OPTION_DESC_panicbuttonemote = [[Cette emote sera utilisée quand vous tapez /gbr panic ou /pb.]]

GBRadio_Localisation.OPTION_NAME_panicbuttonmessage = [[Message du Panic Button]]
GBRadio_Localisation.OPTION_DESC_panicbuttonmessage = [[Ce message sera envoyé sur votre fréquence primaire quand vous tapez /gbr panic ou /pb.]]

GBRadio_Localisation.OPTION_NAME_transmitterlocations = [[Transmetteurs]]
GBRadio_Localisation.OPTION_DESC_transmitterlocations = [[Location (en coordonées et instanceId) des transmetteurs que votre appareil peut utiliser.

NOTE: Ils doivent être au format suivant: x,y,instanceId
Il n'y a pas d'espace.
Vous pouvez mettre plusieurs instanceId en les séparant avec des - (ex 360,420,0-142-9451).
Veuillez séparer chaque entrée sur une nouvelle ligne.]]

GBRadio_Localisation.OPTION_NAME_usetransmitters = [[Mode Transmetteur]]
GBRadio_Localisation.OPTION_DESC_usetransmitters = [[Activer cette option restreindra vos communications à la portée des transmetteurs..]]

GBRadio_Localisation.OPTION_NAME_transmittermaxrange = [[Distance maximale des transmetteurs]]
GBRadio_Localisation.OPTION_DESC_transmittermaxrange = [[La distance maximale à laquelle vous pouvez être d'un transmetteur avant de ne plus pouvoir émettre ou recevoir.]]

GBRadio_Localisation.OPTION_NAME_usetransmitterdistortion = [[Distortion des transmetteurs]]
GBRadio_Localisation.OPTION_DESC_usetransmitterdistortion = [[Activer cette option ajoutera un effet de distortion à vos messages si vous ou l'envoyeur êtes au delà d'une distance spécifiée.]]

GBRadio_Localisation.OPTION_NAME_transmitterlowrange = [[Distance de faible distortion]]
GBRadio_Localisation.OPTION_DESC_transmitterlowrange = [[Distance depuis le transmetteur à laquelle un faible effet de distortion s'ajoutera à vos messages.]]

GBRadio_Localisation.OPTION_NAME_transmittermedrange = [[Distance de moyenne distortion]]
GBRadio_Localisation.OPTION_DESC_transmittermedrange = [[Distance depuis le transmetteur à laquelle un effet moyen de distortion s'ajoutera à vos messages.]]

GBRadio_Localisation.OPTION_NAME_transmitterhighrange = [[Distance d'importante distortion]]
GBRadio_Localisation.OPTION_DESC_transmitterhighrange = [[Distance depuis le transmetteur à laquelle un important effet de distortion s'ajoutera à vos messages.]]

GBRadio_Localisation.OPTION_NAME_playsounds = [[Jouer les sons]]
GBRadio_Localisation.OPTION_DESC_playsounds = [[Joue un son quand vous recevez un message.]]

GBRadio_Localisation.OPTION_NAME_playareasounds = [[Jouer les sons locaux]]
GBRadio_Localisation.OPTION_DESC_playareasounds = [[Joue un son localement que les autres utilisateurs de GHI pourront entendre.

Désactiver cette option fera que les sons ne sont joués que pour vous.

Note: Requiert l'installation de GHI. S'il n'est pas installé, cette option sera ignorée.]]

GBRadio_Localisation.OPTION_NAME_devicesound = [[Son de l'appareil]]
GBRadio_Localisation.OPTION_DESC_devicesound = [[ID du fichier son à jouer quand vous recevez un message.]]

GBRadio_Localisation.OPTION_NAME_loadpresetmsg = [[Dans la liste d'appareils préconfigurés ci-dessous, choisissez celui qui vous convient le mieux.]]

GBRadio_Localisation.OPTION_NAME_loadpreset = [[Charger le preset]]

GBRadio_Localisation.OPTION_NAME_importboxmsg = [[Ici, vous pouvez importer ou exporter la configuration pour GBRadio afin de partager vos options avec vos amis.]]

GBRadio_Localisation.OPTION_NAME_importbox = [[Importer]]
GBRadio_Localisation.OPTION_DESC_importbox = [[Coller votre data d'import GBRadio ici.]]

GBRadio_Localisation.OPTION_NAME_exportbox = [[Export Settings]]
GBRadio_Localisation.OPTION_DESC_exportbox = [[Copiez votre data d'export GBRadio ici.]]

GBRadio_Localisation.OPTION_NAME_ghidetected = [[GHI Installé]]
GBRadio_Localisation.OPTION_DESC_ghidetected = [[Si Gryphonheart Items est installé, les sont se joueront localement par défaut lorsque vous recevez un message.

Note: Vous pouvez désactiver les sons locaux même avec GHI d'activé.]]

GBRadio_Localisation.OPTION_NAME_trp3detected = [[TRP3 Installé]]
GBRadio_Localisation.OPTION_DESC_trp3detected = [[SI TotalRP3 est installé, les joueurs recevant vos messages pourront voir votre nom TRP si leur Mode Meta est activé.]]

GBRadio_Localisation.OPTION_NAME_aboutpage = [[A propos]]
GBRadio_Localisation.OPTION_DESC_aboutpage = [[Thank you for using GBRadio!

GBRadio was developed with communication in mind. Many guard-based roleplaying guilds use radios (or walkers!), and the aim of this addon is to make that as easy and seamless as possible.

A special thanks to the following people and guilds for their help in testing this addon, providing feedback, and giving suggestions:

Etterna @ Argent Dawn
Miléan @ Argent Dawn
Didonus @ Argent Dawn
Harrvey @ Argent Dawn
Yarwood @ Argent Dawn
Lawri @ Argent Dawn

Eye of Dalaran @ Argent Dawn
Stormwind Investigations @ Argent Dawn
Stormwind City Guard @ Argent Dawn

|cFF82C2FFAuthor:|r Nasias @ Argent Dawn (EU)
|cFF82C2FFContact:|r n@siasdarkstar.com

|cFF82C2FFHelp, updates & changelog for BETA:|r
http://www.nasiasdarkstar.com/GBRadio]]

GBRadio_Localisation.OPTION_NAME_helppage = [[Aide]]
GBRadio_Localisation.OPTION_DESC_helppage = [[Liste des commandes les plus utiles:

/gbr -- Montre la liste complète des commandes
/gbr coord -- Affiche les coordonnées à votre position
/gbr activate -- Active ou désactive votre appareil
/bb <votre message> -- Envoie un message.
/wbb <votre message> -- Envoie un message discrètement.
/pb -- Envoie un message de détresse.]]

GBRadio_Localisation.OPTION_NAME_activate = [[Appareil en fonctionnement]]
GBRadio_Localisation.OPTION_DESC_activate = [[Active ou désactive votre appareil]]

GBRadio_Localisation.OPTION_NAME_radiosatedesc = [[Active ou désactive votre appareil. Vous pouvez aussi le faire avec une commande slash!]]
GBRadio_Localisation.OPTION_DESC_radiosatedesc = [[]]

GBRadio_Localisation.OPTION_NAME_isolatedmode = [[Mode isolé]]
GBRadio_Localisation.OPTION_DESC_isolatedmode = [[Restreint les messages aux membres de votre guilde.]]

GBRadio_Localisation.OPTION_NAME_isolatedmodedesc = [[Change entre envoyer et recevoir des messages seulement des membres de votre guilde, ou de tout le monde sur la fréquence radio.]]
GBRadio_Localisation.OPTION_DESC_isolatedmodedesc = [[]]

GBRadio_Localisation.OPTION_NAME_send = [[Envoyer un message]]
GBRadio_Localisation.OPTION_DESC_send = [[<message> - Envoie un message via votre appareil. |cFF00C0FFVous pouvez aussi utiliser la version courte:|r /bb <message>]]

GBRadio_Localisation.OPTION_NAME_panic = [[Panic button]]
GBRadio_Localisation.OPTION_DESC_panic = [[En cas d'urgence. Envoie un message de détresse sur votre fréquence primaire. |cFF00C0FFVous pouvez aussi utiliser la version courte:|r /pb]]

GBRadio_Localisation.OPTION_NAME_coord = [[Coordonées]]
GBRadio_Localisation.OPTION_DESC_coord = [[Indique vos coordonnées actuelles pour le mode transmetteur.]]

GBRadio_Localisation.OPTION_NAME_distance = [[Check Distance]]
GBRadio_Localisation.OPTION_DESC_distance = [[Indique la distance du transmetteur le plus proche.]]

GBRadio_Localisation.OPTION_NAME_freq = [[Setter votre fréquence primaire]]
GBRadio_Localisation.OPTION_DESC_freq = [[<frequencyID> - Change votre fréquence primaire à l'ID spécifié. Les messages sont envoyés sur la fréquence primaire.]]

GBRadio_Localisation.OPTION_NAME_showhistory = [[Historique]]
GBRadio_Localisation.OPTION_DESC_showhistory = [[<lignes> - Affiche x lignes d'historique des messages, en partant de la fin.]]

GBRadio_Localisation.OPTION_NAME_config = [[Configuration]]
GBRadio_Localisation.OPTION_DESC_config = [[Ouvre la fenêtre de configuration pour GBRadio]]

GBRadio_Localisation.OPTION_NAME_textconfig = [[Appareil]]
GBRadio_Localisation.OPTION_DESC_textconfig = [[]]

GBRadio_Localisation.OPTION_NAME_messageconfig = [[Messages]]
GBRadio_Localisation.OPTION_DESC_messageconfig = [[]]

GBRadio_Localisation.OPTION_NAME_transmitterconfig = [[Transmetteurs]]
GBRadio_Localisation.OPTION_DESC_ = [[]]

GBRadio_Localisation.OPTION_NAME_soundconfig = [[Sons]]
GBRadio_Localisation.OPTION_DESC_ = [[]]

GBRadio_Localisation.OPTION_NAME_exportimport = [[Export/Import]]
GBRadio_Localisation.OPTION_DESC_ = [[]]

GBRadio_Localisation.OPTION_NAME_thirdpartymodules = [[3rd Party]]
GBRadio_Localisation.OPTION_DESC_ = [[]]