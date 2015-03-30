window.APP_CONFIG = {
    HTML_CONFIG: {
        chatMessage: function(event, senderData) {
            var userData;
            if (event) {
                userData = JSON.parse(event.from.data)
            }
            var chatMessageString = "";
            chatMessageString += "<li class=media>";
            chatMessageString += "                                <div class=media-body>";
            chatMessageString += "                                    <div class=media>";
            chatMessageString += "                                        <a class=pull-left href=#>";
            chatMessageString += "                                            <img class=media-object img-circle  src=/assets/user.png>";
            chatMessageString += "                                        </a>";
            chatMessageString += "                                        <div class=media-body>" + ((event) ? event.data : senderData.data) + ".";
            chatMessageString += "                                            <br>";
            chatMessageString += "                                            <small class=text-muted>" + ((event) ? userData.name : senderData.name) + " | " + moment(new Date()).format("LLL") + "</small>";
            chatMessageString += "                                            <hr>";
            chatMessageString += "                                        </div>";
            chatMessageString += "                                    </div>";
            chatMessageString += "                                </div>";
            chatMessageString += "                            </li>";
            return chatMessageString;
        },
        videoWindow: function(stream) {
            var userData = JSON.parse(stream.connection.data);
            var smallVideoContainer = "";
            smallVideoContainer += "<li class=col-lg-3>";
            smallVideoContainer += "    <div style='display:none;' class=thumbnail id=stream-duplicate" + stream.streamId + ">";
            smallVideoContainer += "    <a href=#><img src=http://placehold.it/240x160></a>";
            smallVideoContainer += "    </div>";
            smallVideoContainer += "    <div class=thumbnail id=stream" + stream.streamId + ">";
            smallVideoContainer += "        </a>";
            smallVideoContainer += "    </div>";
            smallVideoContainer += "    <div class=caption>";
            smallVideoContainer += "        <h5>" + userData.name + "</h5>";
            smallVideoContainer += "        <button type=button class='btn btn-info' data-toggle=modal data-target='#modal" + stream.connection.connectionId + "'>Chat me</button>";
            smallVideoContainer += "        <!-- Modal -->";
            smallVideoContainer += "        <div class='modal fade' id=modal" + stream.connection.connectionId + " tabindex=-1 role=dialog aria-labelledby=myModalLabel aria-hidden=true>";
            smallVideoContainer += "            <div class=modal-dialog>";
            smallVideoContainer += "                <div class=modal-content>";
            smallVideoContainer += "                    <div class=modal-header>";
            smallVideoContainer += "                        <button type=button class=close data-dismiss=modal aria-label=Close><span aria-hidden=true>&times;</span>";
            smallVideoContainer += "                        </button>";
            smallVideoContainer += "                        <h4 class=modal-title id=myModalLabel>Chat window</h4>";
            smallVideoContainer += "                    </div>";
            smallVideoContainer += "                    <div class=modal-body>";
            smallVideoContainer += "                        <ul class=media-list id=private-chat" + stream.connection.connectionId + ">";
            smallVideoContainer += "";
            smallVideoContainer += "                        </ul>";
            smallVideoContainer += "";
            smallVideoContainer += "                    </div>";
            smallVideoContainer += "                    <div class=modal-footer>";
            smallVideoContainer += "                        <div class=input-group>";
            smallVideoContainer += "                            <input class='form-control private-message' placeholder='Enter Message' type=text data-target=" + stream.connection.connectionId + ">";
            smallVideoContainer += "                            <span class=input-group-btn>";
            smallVideoContainer += "<button class='btn btn-info click-private-message' type=button data-target=" + stream.connection.connectionId + ">SEND</button>";
            smallVideoContainer += "</span>";
            smallVideoContainer += "                        </div>";
            smallVideoContainer += "                    </div>";
            smallVideoContainer += "                </div>";
            smallVideoContainer += "            </div>";
            smallVideoContainer += "        </div>";
            smallVideoContainer += "    </div>";
            smallVideoContainer += "</li>";

            return smallVideoContainer;
        }
    }
}
