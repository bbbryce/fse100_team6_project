import java.io.*;
import java.util.Scanner;
public class GradeBook
{
    Scanner scan;
    public final int NUM_TESTS = 4;
    private int numStudents = 0;
    String[] studentnames;
    char[] finalGrade;
    double[][] testScores;
    String students, line;
    int test;
    boolean first = true;

    public GradeBook(String fileName)
    {
        try
        {
            scan = new Scanner(new File(fileName));
        }
        catch(FileNotFoundException ex) {
            System.out.println("File not Found");
        }
        while(scan.hasNextLine() && first)
        {
            students = scan.nextLine();
            numOfStudents();
            studentnames = new String[numStudents];
            finalGrade = new char[numStudents];
            testScores = new double[numStudents][NUM_TESTS];
            for(int n = 0; n < studentnames.length; n++)
            {
                if(scan.hasNextLine())
                {
                    line = scan.nextLine();
                    studentnames[n] = line.substring(0,line.indexOf(' '));
                    line = line.substring(line.indexOf(' ')+1, line.length());
                    for(int t = 0; t < NUM_TESTS-1; t++)
                    {
                        String num = line.substring(0,line.indexOf(' '));
                        double score = Double.parseDouble(num);
                        testScores[n][t] = score;
                        line = line.substring(line.indexOf(' ')+1,line.length());
                    }
                    testScores[n][testScores[n].length-1] = Double.parseDouble(line);
                    
                }
            }
            first = false;
        }
        assignGrades();
    }

    private void numOfStudents()
    {
        char c = ' ';
        for(test = 0; test < students.length(); test++)
        {
            if(Character.isDigit(students.charAt(test)))
            {
                c = students.charAt(test);
            }
        }
        numStudents = Character.getNumericValue(c);
    }

    private double getStudentAverage(int index)
    {
        if(index < testScores.length)
        {
            double g = 0, lowest = 100;
            for(int r = 0; r < testScores[index].length; r++)
            {
                double one, two, three, four;
                one = testScores[index][r];
                
                if(r+1 < testScores[index].length)
                two = testScores[index][r+1];
                else
                two = 100;
                if(r+2 < testScores[index].length)
                three = testScores[index][r+2];
                else
                three = 100;
                if(r+3 < testScores[index].length)
                four = testScores[index][r+3];
                else
                four = 100;
                
                if(one > lowest)
                {
                    g = g + one;
                }
                else if(one >= two)
                {
                    g = g + one;
                }
                else if(one >= three)
                {
                    g = g + one;
                }
                else if(one >= four)
                {
                    g = g + one;
                }
                else 
                {
                    lowest = testScores[index][r];
                }
            }
            g = g/3;
            return g;
        }
        else
        {
            return -1;
        }
    }

    private void assignGrades()
    {
        for(int s = 0; s < numStudents; s++)
        {
            double grade = getStudentAverage(s);
            if(grade >= 90)
            {
                finalGrade[s] = 'A';
            }
            else if(grade >= 80)
            {
                finalGrade[s] = 'B';
            }
            else if(grade >= 70)
            {
                finalGrade[s] = 'C';   
            }
            else if(grade >= 60)
            {
                finalGrade[s] = 'D';   
            }
            else
            {
                finalGrade[s] = 'E';   
            }
        }
    }

    public String getStudentName(int index)
    {
        String name = null;
        if(index < studentnames.length)
        {
            name = studentnames[index];
            return name;
        }
        else
        {
            return name;
        }
    }

    public char getLetterGrade(int index)
    {
        char grade = ' ';
        if(index > -1 && index < finalGrade.length)
        {
            grade = finalGrade[index];
            return grade;
        }
        else
        {
            return grade;
        }
    }

    public int getIndex(String studentName)
    {
        int index = -1;
        for(int f = 0; f < studentnames.length; f++)
        {
            if(studentnames[f].compareTo(studentName) == 0)
            {
                index = f;
            }
        }
        return index;
    }

    public String toString()
    {
        String str = "";
        for(int students = 0; students < studentnames.length; students++)
        {
            str = str + getStudentName(students) + "\t";
            String strDouble = String.format("%.1f", getStudentAverage(students));
            str = str + strDouble + " ";
            str = str + getLetterGrade(students) + "\n";
        }
        return str;
    }
}
