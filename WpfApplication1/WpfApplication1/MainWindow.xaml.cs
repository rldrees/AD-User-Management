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
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Management.Automation;
using System.Collections.ObjectModel;

namespace WpfApplication1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }
        private void NewClicked(object sender, RoutedEventArgs e)
        {
            newWindow newWindow = new newWindow();
            newWindow.Show();
            
        }
        ///private void TermClicked(object sender, RoutedEventArgs e)
        ///{
       ///     termWindow termWindow = new termWindow();
       ///     termWindow.Show();
       /// }
       /// private void ResetClicked(object sender, RoutedEventArgs e)
      ///  {
      ///      resetWindow resetWindow = new resetWindow();
       ///     resetWindow.Show();
       /// }
    }
}
