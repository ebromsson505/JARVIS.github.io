// UI comp
const startBtn = document.createElement("button");
startBtn.innerHTML = "Start listening";
const result = document.createElement("div");
const processing = document.createElement("p");
document.write("<body><h1>J.A.R.V.I.S.</h1><p>Give it a try with 'hello', 'how are you', 'what's your name', 'what time is it', 'stop', ... </p></body>");
document.body.append(startBtn);
document.body.append(result);
document.body.append(processing);

// speech to text
const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
let toggleBtn = null;
if (typeof SpeechRecognition === "undefined") {
	startBtn.remove();
	result.innerHTML = "<b>Browser does not support Speech API. Please download latest chrome.<b>";
} else {
	const recognition = new SpeechRecognition();
	recognition.continuous = true;
	recognition.interimResults = true;
	recognition.onresult = event => {
		const last = event.results.length - 1;
		const res = event.results[last];
		const text = res[0].transcript;
		if (res.isFinal) {
			processing.innerHTML = "processing ....";

			const response = process(text);
			const p = document.createElement("p");
			p.innerHTML = `You said: ${text} </br>JARVIS said: ${response}`;
			processing.innerHTML = "";
			result.appendChild(p);

			// text to speech
			speechSynthesis.speak(new SpeechSynthesisUtterance(response));
		} else {
			processing.innerHTML = `listening: ${text}`;
		}
	}
	let listening = false;
	toggleBtn = () => {
		if (listening) {
			recognition.stop();
			startBtn.textContent = "Start listening";
		} else {
			recognition.start();
			startBtn.textContent = "Stop listening";
		}
		listening = !listening;
	};
	startBtn.addEventListener("click", toggleBtn);

}

// processor
function process(rawText) {
	let text = rawText.replace(/\s/g, "");
	text = text.toLowerCase();
	let response = null;
	switch(text) {
		      case "hello":
			      response = "hi, how are you doing?"; break;
		      case "what'syourname":
			      response = "My name's JARVIS.";  break;
		      case "howareyou":
			      response = "I'm good."; break;
		      case "whattimeisit":
			      response = new Date().toLocaleTimeString(); break;
		      case "stop":
			      response = "Bye!!";
			      toggleBtn();
          case "hi":
            response = "Hi, how are you doing?"; break;
          case "whatcanyoudo":
            response = "I can tell you the date, tell you a joke, search the internet for things, open pages like google slides and docs,..."; break;
          case "tellmeajoke":
            response = "Why don't scientists trust atoms? ––––– Because they make up everything!"; break;
          case "joke": 
            response = "What happened to iron man when he wanted some salt? ––––– He got a divorce from his wife Pepper!"; break;
          case "slides":
			      open('https://docs.google.com/presentation/u/0/?tgif=d')
			      response = "opening google slides"; break;
		      case "openslides":
			      open('https://docs.google.com/presentation/u/0/?tgif=d')
			      response = "opening google slides"; break;
		      case "opengoogleslides":
            open('https://docs.google.com/presentation/u/0/?tgif=d')
		      	response = "opening google slides"; break;
		      case "docs":
			      open('https://docs.google.com/document/u/0/?tgif=d')
			      response = "opening google docs"; break;
		      case "opendocs":
			      open('https://docs.google.com/document/u/0/?tgif=d')
			      response = "opening google docs"; break;
		      case "opengoogledocs":
			      open('https://docs.google.com/document/u/0/?tgif=d')
			      response = "opening google docs"; break;
		      case "openteams":
            open('https://teams.microsoft.com/go#')
			      response = "opening microsoft teams"; break;
		      case "teams":
			      open('https://teams.microsoft.com/go#')
			      response = "opening microsoft teams"; break;
		      case "openmicrosoftteams":
			      open('https://teams.microsoft.com/go#')
			      response = "opening microsoft teams"; break;
		      case "mail":
			      open('https://outlook.office.com/mail/inbox')
			      response = "opening outlook"; break;
		      case "openmail":
		      	open('https://outlook.office.com/mail/inbox')
			      response = "opening outlook"; break;
		      case "openoutlook":
		      	open('https://outlook.office.com/mail/inbox')
		      	response = "opening outlook"; break;
		      case "openmicrosoftoutlook":
		      	open('https://outlook.office.com/mail/inbox')
		      	response = "opening outlook"; break;
	      	case "gmail":
			      open('https://mail.google.com/mail/u/0/#inbox')
		      	response = "opening gmail"; break;
		      case "opengmail":
		      	open('https://mail.google.com/mail/u/0/#inbox')
		      	response = "opening gmail"; break;
	      	case "youtube":
		      	open('https://www.youtube.com/')
			      response = "opening youtube"; break;
		      case "openyoutube":
			      open('https://www.youtube.com/')
			      response = "opening youtube"; break;
		      case "openupyoutube":
		      	open('https://www.youtube.com/')
		      	response = "opening youtube"; break;
		      case "openupyoutubemusic":
		      	open('https://music.youtube.com/')
		      	response = "opening youtube music"; break;
		      case "openyoutubemusic":
		      	open('https://music.youtube.com/')
		      	response = "opening youtube music"; break;
		      case "youtubemusic":
		      	open('https://music.youtube.com/')
		      	response = "opening youtube music"; break;
		      case "music":
		      	open('https://music.youtube.com/')
		      	response = "opening youtube music"; break;
      		case "classroom":
			      open('https://classroom.google.com/u/0/h')
			      response = "opening google classroom"; break;
		      case "openclassroom":
		      	open('https://classroom.google.com/u/0/h')
			      response = "opening google classroom"; break;
		      case "opengoogleclassroom":
			      open('https://classroom.google.com/u/0/h')
			      response = "opening google classroom"; break;
	}
	if (!response) {
		window.open(`http://google.com/search?q=${rawText.replace("search", "")}`, "_blank");
		return `I found some information for ${rawText}`;
	}
	return response;
}
