<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <!--<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">-->
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    


<!------ Include the above in your HEAD tag ---------->

<div class="container">
    <div class="row">
        <div class="span12">
            <div class="" id="loginModal">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Have an Account?</h3>
                </div>
                <div class="modal-body">
                    <div class="well">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#login" data-toggle="tab">Login</a></li>
                            <li><a href="#create" data-toggle="tab">Create Account</a></li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane active in" id="login">
                                <form class="form-horizontal" action='' method="POST">
                                    <fieldset>
                                        <div id="legend">
                                            <legend class="">Login</legend>
                                        </div>    
                                        <div class="control-group">
                                            <!-- Username -->
                                            <label class="control-label"  for="username">Username</label>
                                            <div class="controls">
                                                <input type="text" id="username" name="username" placeholder="" class="input-xlarge">
                                            </div>
                                        </div>

                                        <div class="control-group">
                                            <!-- Password-->
                                            <label class="control-label" for="password">Password</label>
                                            <div class="controls">
                                                <input type="password" id="password" name="password" placeholder="" class="input-xlarge">
                                            </div>
                                        </div>


                                        <div class="control-group">
                                            <!-- Button -->
                                            <div class="controls">
                                                <button class="btn btn-success">Login</button>
                                            </div>
                                        </div>
                                    </fieldset>
                                </form>                
                            </div>
                            <div class="tab-pane fade" id="create">
                                <form id="tab">
                                    <label>Username</label><br/>
                                    <input type="text" value="" class="input-xlarge"><br/>
                                    <label>First Name</label><br/>
                                    <input type="text" value="" class="input-xlarge"><br/>
                                    <label>Last Name</label><br/>
                                    <input type="text" value="" class="input-xlarge"><br/>
                                    <label>Email</label><br/>
                                    <input type="text" value="" class="input-xlarge"><br/>
                                    <label>Address</label><br/>
                                    <textarea value="Smith" rows="3" class="input-xlarge">
                                    </textarea><br/>

                                    <div>
                                        <button class="btn btn-primary">Create Account</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div></div>