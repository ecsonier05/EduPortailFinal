import React, { useEffect, useState } from 'react';
import { ScrollView, StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import { Dropdown } from 'react-native-element-dropdown';
import { RadioButton } from 'react-native-paper';

function PerfScreen({ navigation }) {

    //Radio Buttons
    const [courChecked, setCourChecked] = React.useState(1);
    const [resultChecked, setResultChecked] = React.useState('moy');

    const matriculeVar = 2051798;

    const [classData, setClassData] = useState(null);
    const [loading, setLoading] = useState(true);


    // Liens BD locale

    const urlClass = `http://192.168.56.1:3000/api/cours/${matriculeVar}`;


    // Liens BD remote

    // const urlClass = `https://eduportail-69af4de32dad.herokuapp.com/api/cours/${matriculeVar}`;


    useEffect(() => {
        fetchData(urlClass, setClassData);
    }, []);

    const fetchData = (url, setData) => {
        fetch(url)
            .then((resp) => {
                if (!resp.ok) {
                    throw new Error('Network response was not ok');
                }
                return resp.json();
            })
            .then((json) => setData(json))
            .catch((error) => console.error('Error fetching data:', error))
            .finally(() => setLoading(false));
    };

    const renderRadio = () => {

        const radioItems = [];

        for (let i = 0; i < (classData ? classData.length : 0); i++) {
            radioItems.push(
                <View style={styles.checkContainer} key={i}>
                    <View style={styles.checkContent}>
                        <RadioButton 
                            value={classData ? classData[i].idInscription : ''}
                            status={ courChecked === (classData ? classData[i].idInscription : '') ? 'checked' : 'unchecked' }
                            onPress={() => setCourChecked(classData ? classData[i].idInscription : '')}
                            color="#3d88ec"
                        />
                        <Text style={styles.titleContent}>{classData ? classData[i].sigle : ''}</Text>
                    </View>
                    <Text style={styles.descContent}>{classData ? classData[i].titreCours : ''}</Text>
                </View>
            );
        }

        return radioItems;
    }

    //Drop Down List
    const data = [
        { label: 'Printemps 2024', value: '1' },
        { label: 'Hiver 2024', value: '2' },
        { label: 'Automne 2023', value: '3' },
        { label: 'Printemps 2023', value: '4' },
    ];

    const [value, setValue] = useState(null);
    const [isFocus, setIsFocus] = useState(false);

    return (
        <View style={styles.container}>
            <Text style={styles.perfTitle}>Ma performance</Text>

            <Text style={styles.guideText}>Veuillez effectuer votre choix.</Text>
            <View style={styles.sessionContainer}>
                <Text style={styles.contLabel}>Session</Text>
                <Dropdown
                    style={[styles.dropdown, isFocus && { borderColor: 'blue' }]}
                    placeholderStyle={styles.placeholderStyle}
                    selectedTextStyle={styles.selectedTextStyle}
                    inputSearchStyle={styles.inputSearchStyle}
                    data={data}
                    labelField="label"
                    valueField="value"
                    placeholder={!isFocus ? 'Select item' : '...'}
                    searchPlaceholder="Search..."
                    value={value}
                    onFocus={() => setIsFocus(true)}
                    onBlur={() => setIsFocus(false)}
                    onChange={item => {
                        setValue(item.value);
                        setIsFocus(false);
                    }}
                />
            </View>
            <View style={styles.resultContainer}>
                <Text style={styles.contLabel}>Résultats</Text>
                {/*rework with radiobutton.item*/}
                <RadioButton.Group onValueChange={resultChecked => setResultChecked(resultChecked)} value={resultChecked}>
                    <RadioButton.Item 
                        label="Moyenne generale"
                        value="moy" 
                        color="white"
                        uncheckedColor="white"
                        style={styles.resultRadioButtons}
                        labelStyle={{
                            color: 'white',
                            fontWeight: 'bold',
                            fontSize: 20
                        }}
                    />
                    <RadioButton.Item 
                        label="Note d'evaluation" 
                        value="note"
                        color="white"
                        uncheckedColor="white"
                        style={styles.resultRadioButtons}
                        labelStyle={{
                            color: 'white',
                            fontWeight: 'bold',
                            fontSize: 20  
                        }}
                    />
                </RadioButton.Group>

            </View>

            {resultChecked != 'moy' ?(
            <View style={styles.coursContainer}>
                <Text style={styles.contLabel}>Cours</Text>
                <ScrollView horizontal>
                    {renderRadio()}        
                </ScrollView>
            </View>
            ) : (
            <View style={styles.coursContainer}></View>    
            )}
            <TouchableOpacity style={styles.submitButton} onPress={() => navigation.navigate('PerfInfo', {id: courChecked, mode: resultChecked})}>
                <Text style={styles.submitText}>OK</Text>
            </TouchableOpacity>
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#e7eff6',
        alignItems: 'center',
        justifyContent: 'flex-end',
    },
    perfTitle: {
        position: 'absolute',
        top: 50,
        alignItems: 'center',
        fontSize: 40,
        fontWeight: 'bold',
    },
    guideText: {
        position: 'absolute',
        top: 140,
        left: 25,
        alignItems: 'center',
        fontSize: 20,
    },
    //use for all text at start of containers
    contLabel: {
        fontSize: 20,
        fontWeight: 'bold',
        marginLeft: 20,
        marginTop: 5,
    },
    sessionContainer: {
        backgroundColor: '#adcbe3',
        width: '90%',
        height: 220,
        borderRadius: 5,
        position: 'absolute',
        top: 170,
    },
    dropdown: {
        width: '90%',
        height: 50,
        borderColor: 'gray',
        backgroundColor: 'white',
        borderWidth: 2,
        borderRadius: 8,
        paddingHorizontal: 8,
        marginLeft: 17,
        marginTop: 10
    },
    placeholderStyle: {
        fontSize: 16,
    },
      selectedTextStyle: {
        fontSize: 16,
    },
    inputSearchStyle: {
        height: 40,
        fontSize: 16,
    },
    resultContainer: {
        backgroundColor: '#adcbe3',
        width: '90%',
        height: 130,
        borderRadius: 5,
        position: 'absolute',
        top: '47%',
    },
    resultRadioButtons: {
        marginVertical: 0.5,
        borderRadius: 5,
        backgroundColor: '#4b86b4',
    },
    buttonText: {
        fontSize: 20,
        fontWeight: 'bold',
        textAlign: 'center',
    },
    coursContainer: {
        backgroundColor: '#adcbe3',
        width: '90%',
        height: 125,
        borderRadius: 5,
        position: 'absolute',
        top: '64%',
    },
    checkContainer: {
        marginLeft: 5
    },
    checkContent: {
        flexDirection: 'row',
        alignItems: 'center',
    },
    titleContent: {
        fontWeight: 'bold',
        fontSize: 17,
    },
    descContent: {
        marginLeft: 40,
        width: 70,
        fontSize: 10,
    },
    submitButton: {
        backgroundColor: '#2a4d69',
        width: '90%',
        height: 40,
        borderRadius: 5,
        alignItems: 'center',
        justifyContent: 'center',
        position: 'absolute',
        top: '79.5%',
    },
    submitText: {
        color: 'white',
        fontSize: 20,
        fontWeight: 'bold'
    }
    
})

export default PerfScreen;