using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Collections.ObjectModel;
using System.Management.Automation;
using System.Management.Automation.Runspaces;
using System.IO;

namespace WpfApplication1
{
    /// <summary>
    /// Interaction logic for Window1.xaml
    /// </summary>
    public partial class newWindow : Window
    {
        string username;
        string firstName;
        string lastName;
        string password;
        string location;
        string jobTitle;
        string manager;
        string phoneFull;
        string phoneExt;
        public newWindow()
        {
            InitializeComponent();
        }

        
        private void CreateClicked(object sender, RoutedEventArgs e)
        {

            username = UsernameEntry.Text;
            firstName = FirstNameEntry.Text;
            lastName = LastNameEntry.Text;
            password = PasswordEntry.Text;
            location = LocationEntry.Text;
            jobTitle = JobTitleEntry.Text;
            manager = ManagerEntry.Text;
            phoneFull = PhoneFullEntry.Text;
            phoneExt = PhoneExtEntry.Text;
            /// Console.Write(username);
            /// Console.Write(firstName);
            /// Console.Write(lastName);
            /// Console.Write(password);
            /// Console.Write(location);
            /// Console.Write(jobTitle);
            /// Console.Write(manager);
            /// Console.Write(phoneFull);
            /// 



            using (var runSpace = RunspaceFactory.CreateRunspace())
            {
                runSpace.Open();
                runSpace.SessionStateProxy.SetVariable("Username", username);
                runSpace.SessionStateProxy.SetVariable("pass", password);
                runSpace.SessionStateProxy.SetVariable("FirstName", firstName);
                runSpace.SessionStateProxy.SetVariable("LastName", lastName);
                runSpace.SessionStateProxy.SetVariable("Location", location);
                runSpace.SessionStateProxy.SetVariable("Job", jobTitle);
                runSpace.SessionStateProxy.SetVariable("Manager", manager);
                runSpace.SessionStateProxy.SetVariable("Phone", phoneFull);
                runSpace.SessionStateProxy.SetVariable("Extension", phoneExt);
                using (var pipeline = runSpace.CreatePipeline("C:\\Scripts\\PS_with_GUI\\GUINewUser.ps1"))
                {
                    pipeline.Invoke();
                }
            }
            
            SuccessWindow SuccessWindow = new SuccessWindow();
            SuccessWindow.Show();
            this.Close();
        }


    }
}
