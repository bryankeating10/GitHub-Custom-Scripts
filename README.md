# GitHub Custom Scripts
Having to write the same series of git commands over and over? Use these PowerShell scripts to optimize your GitHub experience!
Quick disclaimer: as of March 28, 2025, this does not support Linux or MacOS, and was originally written to be most compatable in the VS Code terminal.
Also, checkout the dont-print-status branch for scripts that do not print to the terminal while they are running.
## Content Description
Learn how to [Install and Set Up](#Installation & Setup) the any of the PowerShell scripts. Get a [Description](#Script Descriptions) of the syntax and function of each script
## Installation & Setup
1. To set up the scripts to run globally run command
  a. In File Explorer, right click **This PC** and select **Properties**
  b. Click on **advanced system settings**
  c. In the **System Properties** window, click on the **Environment Variables** button
  d. Under **System variables**, scroll down and select the **Path** variable, then click **Edit**
  e. In the In the **Edit Environment Variable** window, click **New** and add the path to the folder where your script is saved
     (I suggest creating a folder called **GitHub Custom Scripts** to store all current and future scripts
  f. Click **OK** to save
## Scipt Descriptions
### merge-and-cleanup
* Function: Merge your desired pull request and delete the local and remote feature branches
* Usage: merge-and-cleanup <pr id>
### new-tracked-branch
* Function: Create a new feature branch locally and remotely, and set upstream origin
* Usage: new-tracked-branch <feature-branch-name>
