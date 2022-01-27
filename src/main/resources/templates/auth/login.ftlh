<!DOCTYPE html>
<html lang="en">
<#import "/spring.ftl" as spring />
<head>
    <title>Login</title>
</head>
<body>

<#if RequestParameters.error??>
    <p>Invalid username and password.</p>
</#if>

<form action="/login" method="post">
    <div><label> Login: <input type="text" name="username"/> </label></div>
    <div><label> Password: <input type="password" name="password"/> </label></div>
    <div><input type="submit" value="Sign In"/></div>
</form>

<a href="<@spring.url '/registration'/>">registration</a>
</body>
</html>