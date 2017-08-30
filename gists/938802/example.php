<?
require_once('config.php');          // Contains the baseUrl and credentials
require_once('BugzillaClient.php');  // This is the client code

$bzClient = new BugzillaClient($bzBaseUrl, $bzUsername, $bzPassword);

$id = $_POST['id'];
$bug = $bzClient->Get($id);

echo $bug['summary']);
?>